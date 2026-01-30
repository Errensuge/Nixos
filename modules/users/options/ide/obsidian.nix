{
  lib,
  pkgs,
  config,
  ...
}:
with lib;
let
  cfg = config.os.editor.obsidian;
in
{
  options.os.editor.obsidian = {
    enable = mkEnableOption "Obsidian options";
  };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [

      obsidian

    ];
  };
}
