{
  lib,
  pkgs,
  config,
  ...
}:
with lib;
let
  cfg = config.home.ide.jetbrains.rider;
in
{
  options.home.ide.jetbrains.rider = {
    enable = mkEnableOption "JetBrains options";
  };
  config = mkIf cfg.enable {

    home.packages = with pkgs.unstable; [
      jetbrains.rider
    ];

  };
}
