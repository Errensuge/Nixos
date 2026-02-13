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
    enable = mkEnableOption "Zen Editor options";
  };
  config = mkIf cfg.enable {

    home.packages = with pkgs; [
      jdk25
    ];

    home.sessionVariables = {
      JAVA_HOME = "${pkgs.jdk25}";
    };

  };
}
