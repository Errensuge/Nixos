{
  lib,
  pkgs,
  config,
  ...
}:
with lib;
let
  cfg = config.os.shells.pantheon;
in
{
  options.os.shells.pantheon = {
    enable = mkEnableOption "System gnome shell service";
  };
  config = mkIf cfg.enable {

    services.desktopManager.pantheon.enable = true;

    environment = {
      pantheon.excludePackages = with pkgs; [
        elementary-calendar
        elementary-camera
        elementary-mail
        elementary-maps
        elementary-photos
        epiphany
      ];
    };

  };
}
