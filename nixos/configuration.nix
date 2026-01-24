{
  inputs,
  lib,
  config,
  ...
}:
{

  imports = [

    # Hardware
    ./hardware-configuration.nix
    ./configurations/kernel.nix

    # Configurations
    ./configurations/users.nix
    ./configurations/home-manager.nix

  ];

  nixpkgs = {
    overlays = [
      inputs.self.overlays.additions
      inputs.self.overlays.modifications
      inputs.self.overlays.unstable-packages
    ];
  };

  nix =
    let
      flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
    in
    {
      settings = {
        experimental-features = "nix-command flakes";
        flake-registry = ""; # Opinionated: disable global registry
        nix-path = config.nix.nixPath; # Workaround for https://github.com/NixOS/nix/issues/9574
      };
      # Opinionated: make flake registry and nix path match flake inputs
      registry = lib.mapAttrs (_: flake: { inherit flake; }) flakeInputs;
      nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
      channel.enable = false; # Opinionated: disable channels
    };

  networking.hostName = "nixos";
  time.timeZone = "Europe/Brussels";

  # System services
  nixos.boot.systemd.enable = true;
  nixos.boot.plymouth.enable = true;
  nixos.graphics.nvidia.base.enable = true;
  nixos.audio.pipewire.enable = true;
  nixos.networks.dns.enable = true;
  nixos.networks.manager.enable = true;

  # System configurations
  nixos.keyboard.apple.enable = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "25.11";
}
