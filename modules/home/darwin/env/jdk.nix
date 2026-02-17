{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.home.env.jdk;
in
{
  options.home.env.jdk = {
    enable = mkEnableOption "System nh service";
  };
  config = mkIf cfg.enable {

    home.packages = with pkgs; [
      jdk25_headless
      maven
    ];

  };
}
