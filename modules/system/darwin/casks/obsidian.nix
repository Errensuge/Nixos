{ lib, config, ... }:
with lib;
let
  cfg = config.os.homebrew.obsidian;
in
{
  options.os.homebrew.obsidian = {
    enable = mkEnableOption "System obsidian homebrew service";
  };
  config = mkIf cfg.enable {

    homebrew.casks = [
      "obsidian"
    ];

  };
}
