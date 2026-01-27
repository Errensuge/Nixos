{ lib, config, ... }:
with lib;
let
  cfg = config.within.graphics.nvidia;
in
{
  options.within.graphics.nvidia = {
    enable = mkEnableOption "System nvidia service";
  };
  config = mkIf cfg.enable {

    services.xserver.enable = true;
    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.graphics.enable = true;
    hardware.nvidia = {
      open = true;
      nvidiaSettings = false;
      modesetting.enable = true; # Wayland requirements
      powerManagement.enable = true;
    };

  };
}
