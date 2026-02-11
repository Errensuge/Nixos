{
  lib,
  pkgs,
  config,
  ...
}:
with lib;
let
  cfg = config.home.ide.jetbrains.pycharm;
in
{
  options.home.ide.jetbrains.pycharm = {
    enable = mkEnableOption "JetBrains options";
  };
  config = mkIf cfg.enable {

    home.packages = with pkgs.unstable; [
      jetbrains.pycharm
    ];

  };
}
