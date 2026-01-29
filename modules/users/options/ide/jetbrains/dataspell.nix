{
  lib,
  pkgs,
  config,
  ...
}:
with lib;
let
  cfg = config.os.ide.jetbrains.dataspell;
in
{
  options.os.ide.jetbrains.dataspell = {
    enable = mkEnableOption "JetBrains options";
  };
  config = mkIf cfg.enable {

    home.packages = with pkgs.unstable; [
      jetbrains.dataspell
    ];

  };
}
