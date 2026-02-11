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
        ]
        ++ [
          # Gnome files explorer
          nautilus
        ];
    };

    services.gvfs.enable = true; # SMB, FTP, ... access

  };
}
