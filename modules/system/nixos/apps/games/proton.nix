{
  lib,
  config,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.os.apps.games.protonge;
in
{
  options.os.apps.games.protonge = {
    enable = mkEnableOption "System pipewire service";
  };
  config = mkIf cfg.enable {

    environment.systemPackages = with pkgs; [
      umu-launcher
    ];

  };
}
