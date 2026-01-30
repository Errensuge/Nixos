{
  pkgs,
  lib,
  config,
  ...
}:
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
    environment.systemPackages = with pkgs.cudaPackages; [
      cudatoolkit
      cudnn
      libcublas
      libcufile
      libcusparse
      nccl
    ];

    environment.variables = {
      CUDA_PATH = "${pkgs.cudatoolkit}";
      LD_LIBRARY_PATH = "${pkgs.linuxPackages.nvidia_x11}/lib:$LD_LIBRARY_PATH";
      EXTRA_LDFLAGS = "-L/lib -L${pkgs.linuxPackages.nvidia_x11}/lib";
      EXTRA_CCFLAGS = "-I/usr/include";
    };

  };

}
