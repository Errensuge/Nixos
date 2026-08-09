{
  lib,
  pkgs,
  config,
  ...
}:
with lib;
let
  cfg = config.os.shells.gnome;
in
{
  options.os.shells.gnome = {
    enable = mkEnableOption "System gnome shell service";
  };
  config = mkIf cfg.enable {

    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;

    services.gnome.games.enable = false;
    services.gnome.core-apps.enable = false;
    services.gnome.core-developer-tools.enable = false;

    services.gvfs.enable = true; # SMB, FTP, ... access

    environment = {

      gnome.excludePackages = with pkgs; [
        gnome-tour
        gnome-user-docs
      ];

      systemPackages = with pkgs; [
        papers
        nautilus
      ];
    };

  };
}
