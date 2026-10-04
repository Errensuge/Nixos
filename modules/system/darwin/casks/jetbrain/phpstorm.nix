{ lib, config, ... }:
with lib;
let
  cfg = config.os.homebrew.jetbrain.phpstorm;
in
{
  options.os.homebrew.jetbrain.phpstorm = {
    enable = mkEnableOption "System jetbrain homebrew service";
  };
  config = mkIf cfg.enable {

    homebrew.casks = [
      "phpstorm"
    ];

    system.defaults.dock.persistent-apps = [
      { app = "/Applications/PhpStorm.app"; }
    ];

  };
}
