{ lib, config, ... }:
with lib;
let
  cfg = config.os.homebrew.zen;
in
{
  options.os.homebrew.zen = {
    enable = mkEnableOption "System zen homebrew service";
  };
  config = mkIf cfg.enable {

    homebrew.casks = [
      "zen"
    ];

    system.defaults.dock.persistent-apps = [
      { app = "/Applications/Zen.app"; }
    ];

  };
}
