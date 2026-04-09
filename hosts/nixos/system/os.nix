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
  os.networks.samba.enable = true;
  os.networks.printing.enable = true;

  # System configurations
  os.keyboard.apple.enable = true;

  # Virtualisation Apps
  os.virtualisation.cuda.enable = true;
  os.virtualisation.podman.enable = true;

  # Terminal
  os.flatpak.enable = true;
  programs.ssh.enableAskPassword = false; # No-window git push fix

  # Shells configurations
  os.shells.gnome.enable = true;

  # System version
  system.stateVersion = "25.11";
}
