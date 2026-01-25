{ lib, config, ... }:
with lib;
let
  cfg = config.within.graphics.nvidia.prime;
in
{
  options.within.graphics.nvidia.prime = {
    enable = mkEnableOption "System nvidia prime service";
  };
  config = mkIf cfg.enable {

    services.xserver.videoDrivers = [
      "modesetting"
      "nvidia"
    ];

    hardware.nvidia.powerManagement.finegrained = true;
    hardware.nvidia.prime = {
      offload.enable = true;
      intelBusId = "PCI:0@0:2:0";
      nvidiaBusId = "PCI:1@0:0:0";
    };

  };
}
