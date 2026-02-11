{ lib, config, ... }:
with lib;
let
  cfg = config.home.homebrew.obsidian;
in
{
  options.home.homebrew.obsidian = {
    enable = mkEnableOption "System obsidian homebrew service";
  };
  config = mkIf cfg.enable {

    homebrew.casks = [
      "obsidian"
    ];

  };
}
