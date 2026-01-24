{ lib, config, ... }:
with lib;
let
  cfg = config.within.shell.docker;
in
{
  options.within.shell.docker = {
    enable = mkEnableOption "System docker service";
  };
  config = mkIf cfg.enable {

    virtualisation.docker = {
      enable = true;
    };

  };
}
