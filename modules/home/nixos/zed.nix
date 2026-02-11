{
  lib,
  pkgs,
  config,
  ...
}:
with lib;
let
  cfg = config.user.ide.zed;
in
{
  options.user.ide.zed = {
    enable = mkEnableOption "Zen Editor options";
  };
  config = mkIf cfg.enable {

    home.packages = with pkgs; [
      zed-editor
    ];

  };
}
