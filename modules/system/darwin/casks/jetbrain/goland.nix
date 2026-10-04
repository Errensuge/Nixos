{ lib, config, ... }:
with lib;
let
  cfg = config.os.homebrew.jetbrain.goland;
in
{
  options.os.homebrew.jetbrain.goland = {
    enable = mkEnableOption "System jetbrain homebrew service";
  };
  config = mkIf cfg.enable {

    homebrew.casks = [
      "goland"
    ];

    system.defaults.dock.persistent-apps = [
      { app = "/Applications/GoLand.app"; }
    ];

  };
}
