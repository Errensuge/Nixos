{
  lib,
  config,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.os.protonge;
in
{
  options.os.protonge = {
    enable = mkEnableOption "System pipewire service";
  };
  config = mkIf cfg.enable {

    environment.systemPackages = with pkgs; [
      umu-launcher
    ];

  };
}
