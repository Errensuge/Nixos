{ ... }:

{
  nix.settings.trusted-users = [
    "root"
    "alistreaza"
  ];
  nix.settings.experimental-features = "nix-command flakes";

  # System services
  os.boot.systemd.enable = true;
  os.boot.plymouth.enable = true;
  os.graphics.nvidia.enable = true;
  os.audio.pipewire.enable = true;
  os.networks.dns.enable = true;
  os.networks.manager.enable = true;

  # System configurations
  os.keyboard.apple.enable = true;

  # Shell configurations
  os.shell.zsh.enable = true;
  os.shell.git.enable = true;
  os.shell.nh.enable = true;

  # Gnome configurations
  os.gnome.shell.enable = true;
  os.gnome.apps.enable = true;

  # Virtualisation Apps
  os.virtualisation.cuda.enable = true;
  os.virtualisation.podman.enable = true;

  # Dev
  os.shell.devenv.enable = true;

  # System version
  system.stateVersion = "25.11";
}
