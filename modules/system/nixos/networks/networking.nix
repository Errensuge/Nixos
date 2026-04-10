{ lib, config, ... }:
with lib;
let
  cfg = config.os.networking;
in
{
  options.os.networking = {
    enable = mkEnableOption "System networks manager service";
  };
  config = mkIf cfg.enable {

    services.resolved.enable = true;

    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    networking.networkmanager.enable = true;

  };
}
