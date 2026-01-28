{ lib, config, ... }:
with lib;
let
  cfg = config.os.networks.dns;
in
{
  options.os.networks.dns = {
    enable = mkEnableOption "System dns service";
  };
  config = mkIf cfg.enable {

    services.resolved.enable = true;

    services.avahi = {
      enable = true;
      nssmdns4 = true;
    };

  };
}
