{ lib, config, ... }:
with lib;
let
  cfg = config.within.boot.plymouth;
in
{
  options.within.boot.plymouth = {
    enable = mkEnableOption "Boot plymouth service";
  };
  config = mkIf cfg.enable {

    boot.consoleLogLevel = 3;
    boot.initrd.verbose = false;
    boot.kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
    ];

    boot.plymouth.enable = true;

  };
}
