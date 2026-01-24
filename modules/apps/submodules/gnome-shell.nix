{
  lib,
  pkgs,
  config,
  ...
}:
with lib;
let
  cfg = config.within.gnome.shell;
in
{
  options.within.gnome.shell = {
    enable = mkEnableOption "System gnome shell service";
  };
  config = mkIf cfg.enable {

    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;

    services.gnome.games.enable = false;
    services.gnome.core-apps.enable = false;
    services.gnome.core-developer-tools.enable = false;

    environment = {

      gnome.excludePackages = with pkgs; [
        gnome-tour
        gnome-user-docs
      ];

      systemPackages = with pkgs; [

        # Gnome terminal
        ghostty

        # Gnome icons
        papirus-icon-theme

        # Gnome Extensions
        gnomeExtensions.vitals
        gnomeExtensions.paperwm
        gnomeExtensions.app-hider
        gnomeExtensions.dash-to-panel

      ];
    };

  };
}
