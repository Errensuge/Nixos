{
  lib,
  pkgs,
  config,
  ...
}:
with lib;
let
  cfg = config.os.shell.devenv;
in
{
  options.os.shell.devenv = {
    enable = mkEnableOption "Devenv options";
  };
  config = mkIf cfg.enable {

    environment.systemPackages = [
      pkgs.devenv
    ];

  };
}
