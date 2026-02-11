{
  lib,
  pkgs,
  config,
  ...
}:
with lib;
let
  cfg = config.home.editor.obsidian;
in
{
  options.home.editor.obsidian = {
    enable = mkEnableOption "Obsidian options";
  };
  config = mkIf cfg.enable {

    home.packages = with pkgs; [
      obsidian
    ];

  };
}
