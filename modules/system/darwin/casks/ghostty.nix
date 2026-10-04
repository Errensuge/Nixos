{ lib, config, ... }:
with lib;
let
  cfg = config.os.homebrew.ghostty;
in
{
  options.os.homebrew.ghostty = {
    enable = mkEnableOption "System iterm homebrew service";
  };
  config = mkIf cfg.enable {

    homebrew.casks = [
      "ghostty"
    ];

    system.defaults.dock.persistent-apps = [
      { app = "/Applications/Ghostty.app"; }
    ];

  };
}
