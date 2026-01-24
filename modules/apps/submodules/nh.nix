{ lib, config, ... }:
with lib;
let
  cfg = config.within.shell.nh;
in
{
  options.within.shell.nh = {
    enable = mkEnableOption "System nh service";
  };
  config = mkIf cfg.enable {

    programs.nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 2d --keep 3";
    };

  };
}
