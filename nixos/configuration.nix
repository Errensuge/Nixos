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

    # Modules
    inputs.self.nixos
    inputs.self.apps

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
  networking.firewall.enable = true;

  time.timeZone = "Europe/Brussels";

  # System services
  within.boot.systemd.enable = true;
  within.boot.plymouth.enable = true;
  within.graphics.nvidia.enable = true;
  within.audio.pipewire.enable = true;
  within.networks.dns.enable = true;
  within.networks.manager.enable = true;

  # System configurations
  within.keyboard.apple.enable = true;

  # Shell configurations
  within.shell.zsh.enable = true;
  within.shell.git.enable = true;
  within.shell.nh.enable = true;

  # Gnome configurations
  within.gnome.shell.enable = true;
  within.gnome.apps.enable = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "25.11";
}
