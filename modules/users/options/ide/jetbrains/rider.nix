{
  lib,
  pkgs,
  config,
  ...
}:
with lib;
let
  cfg = config.os.ide.jetbrains.rider;
in
{
  options.os.ide.jetbrains.rider = {
    enable = mkEnableOption "JetBrains options";
  };
  config = mkIf cfg.enable {

    home.packages = with pkgs.unstable; [
      jetbrains.rider
    ];

  };
}
