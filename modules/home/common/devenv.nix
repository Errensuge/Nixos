{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.user.shell.devenv;
in
{
  options.user.shell.devenv = {
    enable = mkEnableOption "System devenv service";
  };
  config = mkIf cfg.enable {

    home.packages = with pkgs; [
      devenv
    ];

  };
}
