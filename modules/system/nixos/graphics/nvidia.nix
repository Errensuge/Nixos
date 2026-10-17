{
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.os.graphics.nvidia;
in
{
  options.os.graphics.nvidia = {
    enable = mkEnableOption "System nvidia service";
  };
  config = mkIf cfg.enable {

    hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.latest;

    services.xserver.enable = true;
    services.xserver.videoDrivers = [
      "modesetting"
      "nvidia"
    ];

    hardware.graphics.enable = true;

    hardware.nvidia = {
      open = true;
      nvidiaSettings = false;
      modesetting.enable = true; # Wayland requirements
      powerManagement.enable = true;
      prime = {
        intelBusId = "PCI:0@0:2:0";
        nvidiaBusId = "PCI:1@0:0:0";
      };
    };

    os.graphics.nvidia.systemd.enable = true;

  };
}
