{ lib, config, ... }:
with lib;
let
  cfg = config.within.boot.systemd;
in
{
  options.within.boot.systemd = {
    enable = mkEnableOption "Boot systemd service";
  };
  config = mkIf cfg.enable {

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.systemd-boot.consoleMode = "max";

  };
}
