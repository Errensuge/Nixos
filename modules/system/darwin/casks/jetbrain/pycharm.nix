{ lib, config, ... }:
with lib;
let
  cfg = config.os.homebrew.jetbrain.pycharm;
in
{
  options.os.homebrew.jetbrain.pycharm = {
    enable = mkEnableOption "System jetbrain homebrew service";
  };
  config = mkIf cfg.enable {

    homebrew.casks = [
      "pycharm"
    ];

  };
}
