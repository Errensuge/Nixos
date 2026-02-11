{ lib, config, ... }:
with lib;
let
  cfg = config.os.virtualisation.docker;
in
{
  options.os.virtualisation.docker = {
    enable = mkEnableOption "System docker service";
  };
  config = mkIf cfg.enable {

    virtualisation.docker = {
      enable = true;
      daemon.settings.features.cdi = true;
    };

  };
}
