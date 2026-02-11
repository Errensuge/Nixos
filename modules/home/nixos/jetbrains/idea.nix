{
  lib,
  pkgs,
  config,
  ...
}:
with lib;
let
  cfg = config.user.ide.jetbrains.idea;
in
{
  options.user.ide.jetbrains.idea = {
    enable = mkEnableOption "JetBrains options";
  };
  config = mkIf cfg.enable {

    home.packages = with pkgs.unstable; [
      jetbrains.idea
    ];

  };
}
