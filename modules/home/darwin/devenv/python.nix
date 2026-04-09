{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.home.env.python;
in
{
  options.home.env.python = {
    enable = mkEnableOption "System nh service";
  };
  config = mkIf cfg.enable {

    home.packages = with pkgs; [
      uv
    ];

  };
}
