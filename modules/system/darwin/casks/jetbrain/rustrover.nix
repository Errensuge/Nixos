{ lib, config, ... }:
with lib;
let
  cfg = config.os.homebrew.jetbrain.rustrover;
in
{
  options.os.homebrew.jetbrain.rustrover = {
    enable = mkEnableOption "System jetbrain homebrew service";
  };
  config = mkIf cfg.enable {

    homebrew.casks = [
      "rustrover"
    ];

    system.defaults.dock.persistent-apps = [
      { app = "/Applications/RustRover.app"; }
    ];

  };
}
