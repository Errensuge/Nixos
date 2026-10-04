{
  lib,
  pkgs,
  config,
  ...
}:
with lib;
let
  cfg = config.home.shell.devenv;
in
{
  options.home.shell.devenv = {
    enable = mkEnableOption "Git options";
  };
  config = mkIf cfg.enable {

    home.packages = with pkgs; [
      devenv
    ];

  };
}
