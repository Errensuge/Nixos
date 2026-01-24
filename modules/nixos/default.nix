{
  boot = import ./services/boot.nix;
  graphics = import ./services/graphics.nix;
  networks = import ./services/networks.nix;
  audio = import ./services/audio.nix;
  keyboard = import ./services/keyboard.nix;
}
