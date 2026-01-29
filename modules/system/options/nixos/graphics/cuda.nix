{ lib, config, ... }:
with lib;
let
  cfg = config.os.virtualisation.cuda;
in
{
  options.os.virtualisation.cuda = {
    enable = mkEnableOption "System CUDA service";
  };
  config = mkIf cfg.enable {

    hardware.nvidia-container-toolkit.enable = true;

  };
}
