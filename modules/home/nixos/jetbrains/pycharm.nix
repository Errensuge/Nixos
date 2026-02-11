{
  lib,
  pkgs,
  config,
  ...
}:
with lib;
let
  cfg = config.user.ide.jetbrains.pycharm;
in
{
  options.user.ide.jetbrains.pycharm = {
    enable = mkEnableOption "JetBrains options";
  };
  config = mkIf cfg.enable {

    home.packages = with pkgs.unstable; [
      jetbrains.pycharm
    ];

  };
}
