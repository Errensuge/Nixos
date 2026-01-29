{
  lib,
  pkgs,
  config,
  ...
}:
with lib;
let
  cfg = config.os.ide.jetbrains.goland;
in
{
  options.os.ide.jetbrains.goland = {
    enable = mkEnableOption "JetBrains options";
  };
  config = mkIf cfg.enable {

    home.packages = with pkgs.unstable; [
      jetbrains.goland
    ];

  };
}
