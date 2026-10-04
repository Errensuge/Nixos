{ lib, config, ... }:
with lib;
let
  cfg = config.os.homebrew.microsoft.team;
in
{
  options.os.homebrew.microsoft.team = {
    enable = mkEnableOption "System microsoft homebrew service";
  };
  config = mkIf cfg.enable {

    homebrew.casks = [
      "microsoft-teams"
    ];

    system.defaults.dock.persistent-apps = [
      { app = "/Applications/Microsoft Teams.app"; }
    ];

  };
}
