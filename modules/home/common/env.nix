{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.home.shell.env;
in
{
  options.home.shell.env = {
    enable = mkEnableOption "System devenv service";
  };
  config = mkIf cfg.enable {

    home.packages = with pkgs; [
      devenv
    ];

  };
}
