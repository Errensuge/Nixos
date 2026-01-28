{ lib, config, ... }:
with lib;
let
  cfg = config.os.shell.docker;
in
{
  options.os.shell.docker = {
    enable = mkEnableOption "System docker service";
  };
  config = mkIf cfg.enable {

    virtualisation.docker = {
      enable = true;
    };

  };
}
