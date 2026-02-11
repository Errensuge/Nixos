{
  lib,
  pkgs,
  config,
  ...
}:
with lib;
let
  cfg = config.home.md.obsidian;
in
{
  options.home.md.obsidian = {
    enable = mkEnableOption "Obsidian options";
  };
  config = mkIf cfg.enable {

    home.packages = with pkgs; [
      obsidian
    ];

  };
}
