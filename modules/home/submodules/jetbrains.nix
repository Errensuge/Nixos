{
  lib,
  pkgs,
  config,
  ...
}:
with lib;
let
  cfg = config.within.home.jetbrains;
in
{
  options.within.home.jetbrains = {
    enable = mkEnableOption "System dns service";
  };
  config = mkIf cfg.enable {

    home.packages = with pkgs.unstable; [
      jetbrains.pycharm
    ];

  };
}
