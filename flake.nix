{
  description = "NixOS files config";

  inputs = {
    import-tree.url = "github:vic/import-tree";
    flake-parts.url = "github:hercules-ci/flake-parts";

    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # Nix Darwin
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-26.05";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Nix Flatpak
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

    # Nix Homebrew
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    homebrew-core.url = "github:homebrew/homebrew-core";
    homebrew-core.flake = false;
    homebrew-cask.url = "github:homebrew/homebrew-cask";
    homebrew-cask.flake = false;
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nix-darwin,
      flake-parts,
      import-tree,
      nix-flatpak,
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
                self = self;
                import-tree = import-tree;
                home-manager = home-manager;
                nixpkgs = nixpkgs;
                nixpkgs-unstable = nixpkgs-unstable;
              };
              modules = [
                (import-tree ./overlays/nixos)
                (import-tree ./hosts/common)

                (import-tree ./modules/system/nixos)
                (import-tree ./hosts/nixos/system)
              ]
              ++ [
                (import-tree ./overlays/nixos)

                nix-flatpak.nixosModules.nix-flatpak
                home-manager.nixosModules.home-manager

                (import-tree ./hosts/common)
                (import-tree ./hosts/nixos/home/users)
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
                nix-homebrew.darwinModules.nix-homebrew
                (import-tree ./modules/system/darwin)

                (import-tree ./hosts/common)
                (import-tree ./hosts/darwin/system)
              ]
              ++ [
                (import-tree ./overlays/darwin)

                home-manager.darwinModules.home-manager
                (import-tree ./hosts/common)
                (import-tree ./hosts/darwin/home/users)
              ];
            };
          };
        };
      }
    );
}
