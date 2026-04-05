{ ... }:

{
  # System services
  os.boot.systemd.enable = true;
  os.boot.plymouth.enable = true;
  os.graphics.nvidia.enable = true;
  os.audio.pipewire.enable = true;

  # Networks services
  os.networks.dns.enable = true;
  os.networks.manager.enable = true;

  # Printing and sharing
  os.networks.printing.enable = true;
  os.networks.samba.enable = true;

  # System configurations
  os.keyboard.apple.enable = true;

  # Gnome configurations
  os.gnome.shell.enable = true;
  os.gnome.apps.enable = true;

  # Virtualisation Apps
  os.virtualisation.cuda.enable = true;
  os.virtualisation.podman.enable = true;

  # Flatpak
  os.flatpak.apps.enable = true;

  # Ssh
  programs.ssh.enableAskPassword = false; # No-window git push fix

  # System version
  system.stateVersion = "25.11";
}
