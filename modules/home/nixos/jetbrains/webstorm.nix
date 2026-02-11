{
  lib,
  pkgs,
  config,
  ...
}:
with lib;
let
  cfg = config.user.ide.jetbrains.webstorm;
in
{
  options.user.ide.jetbrains.webstorm = {
    enable = mkEnableOption "JetBrains options";
  };
  config = mkIf cfg.enable {

    home.packages = with pkgs.unstable; [
      jetbrains.webstorm
    ];

  };
}
