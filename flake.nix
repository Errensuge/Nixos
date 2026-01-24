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

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    systems = ["x86_64-linux"];
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {

    packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
    overlays = import ./overlays {inherit inputs;};

    nixos = import ./modules/nixos;
    home = import ./modules/home;
    apps = import ./modules/apps;

    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [./nixos/configuration.nix];
      };
    };

  };
}
