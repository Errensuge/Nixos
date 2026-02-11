{
  lib,
  pkgs,
  config,
  ...
}:
with lib;
let
  cfg = config.home.ide.jetbrains.idea;
in
{
  options.home.ide.jetbrains.idea = {
    enable = mkEnableOption "JetBrains options";
  };
  config = mkIf cfg.enable {

    home.packages = with pkgs.unstable; [
      jetbrains.idea
    ];

  };
}
