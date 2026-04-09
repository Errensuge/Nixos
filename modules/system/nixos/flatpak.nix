{ lib, config, ... }:
with lib;
let
  cfg = config.os.flatpak;
in
{
  options.os.flatpak = {
    enable = mkEnableOption "System pipewire service";
  };
  config = mkIf cfg.enable {

    services.flatpak.enable = true;
    services.flatpak.update.auto = {
      enable = true;
      onCalendar = "weekly"; # Default value
    };

  };
}
