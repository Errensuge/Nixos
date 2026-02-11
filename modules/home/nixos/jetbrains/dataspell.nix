{
  lib,
  pkgs,
  config,
  ...
}:
with lib;
let
  cfg = config.home.ide.jetbrains.dataspell;
in
{
  options.home.ide.jetbrains.dataspell = {
    enable = mkEnableOption "JetBrains options";
  };
  config = mkIf cfg.enable {

    home.packages = with pkgs.unstable; [
      jetbrains.dataspell
    ];

  };
}
