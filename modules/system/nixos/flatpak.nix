{ lib, config, ... }:
with lib;
let
  cfg = config.os.flatpak;
in
{
  options.os.flatpak = {
    gtk = mkEnableOption "Flatpak app install";
    enable = mkEnableOption "System pipewire service";
  };
  config = mkIf cfg.enable {

    services.flatpak = {
      enable = true;
      update.auto = {
        enable = true;
        onCalendar = "weekly"; # Default value
      };
      packages =
        [ ]
        ++ lib.optionals cfg.gtk [
          "io.github.flattool.Warehouse"
        ];
    };

  };
}
