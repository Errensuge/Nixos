{ lib, config, ... }:
with lib;
let
  cfg = config.os.homebrew.microsoft.powerpoint;
in
{
  options.os.homebrew.microsoft.powerpoint = {
    enable = mkEnableOption "System microsoft homebrew service";
  };
  config = mkIf cfg.enable {

    homebrew.casks = [
      "microsoft-powerpoint"
    ];

    system.defaults.dock.persistent-apps = [
      { app = "/Applications/Microsoft PowerPoint.app"; }
    ];

  };
}
