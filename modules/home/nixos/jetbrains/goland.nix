{
  lib,
  pkgs,
  config,
  ...
}:
with lib;
let
  cfg = config.home.ide.jetbrains.goland;
in
{
  options.home.ide.jetbrains.goland = {
    enable = mkEnableOption "JetBrains options";
  };
  config = mkIf cfg.enable {

    home.packages = with pkgs.unstable; [
      jetbrains.goland
    ];

  };
}
