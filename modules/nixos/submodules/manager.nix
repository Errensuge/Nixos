{ lib, config, ... }:
with lib;
let
  cfg = config.within.networks.manager;
in
{
  options.within.networks.manager = {
    enable = mkEnableOption "System networks manager service";
  };
  config = mkIf cfg.enable {

    networking.networkmanager.enable = true;

  };
}
