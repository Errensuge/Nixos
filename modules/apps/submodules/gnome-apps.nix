{
  lib,
  pkgs,
  config,
  ...
}:
with lib;
let
  cfg = config.within.gnome.apps;
in
{
  options.within.gnome.apps = {
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
        ]
        ++ [
          # Gnome files explorer
          nautilus
        ];
    };

    services.gvfs.enable = true; # SMB, FTP, ... access

  };
}
