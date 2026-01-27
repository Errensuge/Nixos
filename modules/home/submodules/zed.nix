{
  lib,
  pkgs,
  config,
  ...
}:
with lib;
let
  cfg = config.within.home.zed;
in
{
  options.within.home.zed = {
    enable = mkEnableOption "System dns service";
  };
  config = mkIf cfg.enable {

    home.packages = with pkgs; [

      zed-editor
      nil
      nixd

    ];

  };
}
