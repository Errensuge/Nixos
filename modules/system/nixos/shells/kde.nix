{
  lib,
  pkgs,
  config,
  ...
}:
with lib;
let
  cfg = config.os.shells.kde;
in
{
  options.os.shells.kde = {
    enable = mkEnableOption "System gnome shell service";
  };
  config = mkIf cfg.enable {

    services.displayManager.plasma-login-manager.enable = true;
    services.desktopManager.plasma6.enable = true;

    environment = {

      plasma6.excludePackages = with pkgs; [
        aurorae
        plasma-browser-integration
        kwin-x11
        (lib.getBin qttools) # Expose qdbus in PATH
        elisa
        gwenview
        ktexteditor # provides elevated actions for kate
        khelpcenter
        baloo-widgets # baloo information in Dolphin
        spectacle
        krdp
      ];
    };

  };
}
