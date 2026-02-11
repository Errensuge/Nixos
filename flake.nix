{
  description = "NixOS files config";

  inputs = {
    import-tree.url = "github:vic/import-tree";
    flake-parts.url = "github:hercules-ci/flake-parts";

    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # Nix Darwin
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Nix Homebrew
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nix-darwin,
      flake-parts,
      import-tree,
      home-manager,
      nix-homebrew,
      homebrew-core,
      homebrew-cask,
      nixpkgs-unstable,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } (
      { ... }:
      {
        systems = [
          "x86_64-linux"
          "aarch64-darwin"
        ];
        flake = {
          nixosConfigurations = {
            nixos = nixpkgs.lib.nixosSystem {
              specialArgs = {
                import-tree = import-tree;
                home-manager = home-manager;
              };
              modules = [
                (import-tree ./hosts/common)
                (import ./hosts/nixos/overlays.nix { inherit nixpkgs nixpkgs-unstable; })

                (import-tree ./modules/system/common)
                (import-tree ./modules/system/nixos)
                (import-tree ./hosts/nixos/system)
              ]
              ++ [
                (import-tree ./hosts/common)
                home-manager.nixosModules.home-manager
                (import ./hosts/nixos/overlays.nix { inherit nixpkgs nixpkgs-unstable; })

                (import-tree ./modules/home/nixos)
                (import-tree ./hosts/darwin/home)
              ];
            };
          };
          darwinConfigurations = {
            "MacBook-Air-de-Laurent" = nix-darwin.lib.darwinSystem {
              specialArgs = {
                self = self;
                import-tree = import-tree;
                home-manager = home-manager;
                homebrew-core = homebrew-core;
                homebrew-cask = homebrew-cask;
              };
              modules = [
                (import-tree ./hosts/common)
                nix-homebrew.darwinModules.nix-homebrew
                (import ./hosts/nixos/overlays.nix { inherit nixpkgs nixpkgs-unstable; })

                (import-tree ./modules/system/common)
                (import-tree ./hosts/darwin/system)
              ]
              ++ [
                (import-tree ./hosts/common)
                home-manager.darwinModules.home-manager
                (import ./hosts/nixos/overlays.nix { inherit nixpkgs nixpkgs-unstable; })

                (import-tree ./modules/home/darwin)
                (import-tree ./hosts/darwin/home)
              ];
            };
          };
        };
      }
    );
}
