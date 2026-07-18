{ ... }:

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

  # Virtualisation Apps
  os.virtualisation.cuda.enable = false;
  os.virtualisation.podman.enable = true;

  # Shells configurations
  os.shells.pantheon.enable = true;

  # Terminal
  programs.ssh.enableAskPassword = false; # No-window git push fix

  # System version
  system.stateVersion = "26.05";
}
