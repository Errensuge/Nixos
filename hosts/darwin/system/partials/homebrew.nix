{ config, ... }:
{
  homebrew.enable = true;
  homebrew.taps = builtins.attrNames config.nix-homebrew.taps;
}
