{ lib, config, ... }:
with lib;
let
  cfg = config.home.xdg;
in
{
  options.home.xdg = {
    enable = mkEnableOption "Xdg service";
  };
  config = mkIf cfg.enable {

    xdg = {
      userDirs = {
        enable = true;
        createDirectories = true;
      };
    };

  };
}
