{
  lib,
  pkgs,
  config,
  ...
}:
with lib;
let
  cfg = config.os.gnome.apps;
in
{
  options.os.gnome.apps = {
    enable = mkEnableOption "System gnome apps service";
  };
  config = mkIf cfg.enable {

    environment = {
      systemPackages =
        with pkgs;
        [
          # Gnome media apps
          papers
          celluloid
          resources
          gnome-system-monitor
        ]
        ++ [
          # Gnome files explorer
          nautilus
          refine
        ];
    };

    services.gvfs.enable = true; # SMB, FTP, ... access

  };
}
