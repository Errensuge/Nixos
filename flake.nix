{
  description = "NixOS files config";

  inputs = {
    import-tree.url = "github:vic/import-tree";
    flake-parts.url = "github:hercules-ci/flake-parts";

    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      nixpkgs,
      flake-parts,
      import-tree,
      home-manager,
      nixpkgs-unstable,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } (
      { ... }:
      {
        systems = [ "x86_64-linux" ];
        flake = {
          nixosConfigurations = {
            nixos = nixpkgs.lib.nixosSystem {
              modules = [
                (import-tree ./modules/system)
                ./modules/hardware-configuration.nix
                (import ./modules/overlays.nix { inherit nixpkgs nixpkgs-unstable; })
              ]
              ++ [
                home-manager.nixosModules.home-manager
                (import ./modules/overlays.nix { inherit nixpkgs nixpkgs-unstable; })
                (import ./modules/users/home.nix { inherit import-tree home-manager; })
              ];
            };
          };
        };
      }
    );
}
