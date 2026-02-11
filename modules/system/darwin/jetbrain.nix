{ lib, config, ... }:
with lib;
let
  cfg = config.os.homebrew.jetbrain;
in
{
  options.os.homebrew.jetbrain = {
    enable = mkEnableOption "System jetbrain homebrew service";
  };
  config = mkIf cfg.enable {

    homebrew.casks = [
      "intellij-idea"
      "pycharm"
      "phpstorm"
      "rustrover"
      "goland"
      "datagrip"
      "dataspell"
      "clion"
    ];

  };
}
