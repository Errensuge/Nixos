{ lib, config, ... }:
with lib;
let
  cfg = config.os.boot.systemd;
in
{
  options.os.boot.systemd = {
    enable = mkEnableOption "Boot systemd service";
  };
  config = mkIf cfg.enable {

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.systemd-boot.consoleMode = "max";

  };
}
