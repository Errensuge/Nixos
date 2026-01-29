{
  lib,
  pkgs,
  config,
  ...
}:
with lib;
let
  cfg = config.os.ide.jetbrains.pycharm;
in
{
  options.os.ide.jetbrains.pycharm = {
    enable = mkEnableOption "JetBrains options";
  };
  config = mkIf cfg.enable {

    home.packages = with pkgs.unstable; [
      jetbrains.pycharm
    ];

  };
}
