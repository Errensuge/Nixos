{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.home.shell.devenv;
in
{
  options.home.shell.devenv = {
    enable = mkEnableOption "System devenv service";
  };
  config = mkIf cfg.enable {

    home.packages = with pkgs; [
      devenv
    ];

  };
}
