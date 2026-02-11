{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.os.shell.devenv;
in
{
  options.os.shell.devenv = {
    enable = mkEnableOption "System devenv service";
  };
  config = mkIf cfg.enable {

    environment.systemPackages = with pkgs; [
      devenv
    ];

  };
}
