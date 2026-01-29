{
  lib,
  pkgs,
  config,
  ...
}:
with lib;
let
  cfg = config.os.ide.jetbrains.clion;
in
{
  options.os.ide.jetbrains.clion = {
    enable = mkEnableOption "JetBrains options";
  };
  config = mkIf cfg.enable {

    home.packages = with pkgs.unstable; [
      jetbrains.clion
    ];

  };
}
