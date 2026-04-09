{ lib, config, ... }:
with lib;
let
  cfg = config.os.networks.manager;
in
{
  options.os.networks.manager = {
    enable = mkEnableOption "System networks manager service";
  };
  config = mkIf cfg.enable {

    networking.networkmanager.enable = true;

  };
}
