{ ... }:

{
  # System services
  os.boot.limine.enable = true;
  os.boot.plymouth.enable = true;
  os.graphics.nvidia.enable = true;
  os.audio.pipewire.enable = true;

  # Networks services
  os.networking.enable = true;

  # Printing and sharing
  os.networks.samba.enable = true;
  os.networks.printing.enable = true;

  # System configurations
  os.keyboard.apple.enable = true;

  # Flatpak configuration
  os.flatpak.enable = true;

  # Virtualisation Apps
  os.virtualisation.cuda.enable = false;
  os.virtualisation.docker.enable = true;

  # Shells configurations
  os.shells.gnome.enable = true;

  # Terminal
  programs.ssh.enableAskPassword = false; # No-window git push fix

  # System version
  system.stateVersion = "26.05";
}
