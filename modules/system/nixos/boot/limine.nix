{ lib, config, ... }:
with lib;
let
  cfg = config.os.boot.limine;
in
{
  options.os.boot.limine = {
    enable = mkEnableOption "Boot Limine service";
  };
  config = mkIf cfg.enable {

    boot.loader = {
      limine = {
        enable = true;
        maxGenerations = 10;
      };
      efi.canTouchEfiVariables = true;
    };

  };
}
