{ lib, config, ... }:
with lib;
let
  cfg = config.os.bluetooth;
in
{
  options.os.bluetooth = {
    enable = mkEnableOption "System networks manager service";
  };
  config = mkIf cfg.enable {

    hardware.bluetooth.enable = true;

  };
}
