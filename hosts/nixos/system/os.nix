{ pkgs, ... }:

{
  # System services
  os.boot.systemd.enable = true;
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

  # Podman & Cuda
  os.virtualisation.cuda.enable = true;
  os.virtualisation.podman.enable = true;

  # Shells configurations
  os.flatpak.enable = true;
  os.shells.gnome.enable = true;

  # Apps configurations
  os.flatpak.gtk = true;
  os.virtualisation.podman.gtk = true;

  # Terminal
  programs.ssh.enableAskPassword = false; # No-window git push fix

  # System version
  system.stateVersion = "26.05";
}
