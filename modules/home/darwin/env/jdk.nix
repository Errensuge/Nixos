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
    ];

    home.sessionVariables = {
      JAVA_HOME = "${pkgs.jdk25_headless}";
      M2_HOME = "${config.home.sessionVariables.XDG_DATA_HOME}/m2";
    };

  };
}
