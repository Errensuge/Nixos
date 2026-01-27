{
  description = "NixOS files config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      systems = [ "x86_64-linux" ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
      overlays = import ./overlays { inherit inputs; };

      apps = import ./modules/apps;
      home = import ./modules/home;
      nixos = import ./modules/nixos;

      nix.settings.experimental-features = "nix-command flakes";

      nixpkgs = {
        overlays = [
          inputs.self.overlays.additions
          inputs.self.overlays.modifications
          inputs.self.overlays.unstable-packages
        ];
      };

      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            (
              { ... }:
              {
                nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (nixpkgs.lib.getName pkg) [ "nvidia-x11" ];
              }
            )
            ./nixos/configuration.nix
          ]
          ++ [
            {}
            home-manager.nixosModules.home-manager
            ./home/configuration.nix
          ];
        };
      };
    };
}
