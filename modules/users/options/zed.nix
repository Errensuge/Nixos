{
  lib,
  pkgs,
  config,
  ...
}:
with lib;
let
  cfg = config.os.ide.zed;
in
{
  options.os.ide.zed = {
    enable = mkEnableOption "Zen Editor options";
  };
  config = mkIf cfg.enable {

    home.packages = with pkgs; [

      zed-editor
      nil
      nixd

    ];

  };
}
