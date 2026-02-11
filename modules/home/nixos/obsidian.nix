{
  lib,
  pkgs,
  config,
  ...
}:
with lib;
let
  cfg = config.user.editor.obsidian;
in
{
  options.user.editor.obsidian = {
    enable = mkEnableOption "Obsidian options";
  };
  config = mkIf cfg.enable {

    home.packages = with pkgs; [
      obsidian
    ];

  };
}
