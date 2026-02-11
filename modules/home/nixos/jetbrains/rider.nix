{
  lib,
  pkgs,
  config,
  ...
}:
with lib;
let
  cfg = config.user.ide.jetbrains.rider;
in
{
  options.user.ide.jetbrains.rider = {
    enable = mkEnableOption "JetBrains options";
  };
  config = mkIf cfg.enable {

    home.packages = with pkgs.unstable; [
      jetbrains.rider
    ];

  };
}
