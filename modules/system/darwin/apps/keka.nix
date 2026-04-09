{ lib, config, ... }:
with lib;
let
  cfg = config.os.homebrew.keka;
in
{
  options.os.homebrew.keka = {
    enable = mkEnableOption "System keka homebrew service";
  };
  config = mkIf cfg.enable {

    homebrew.casks = [
      "keka"
    ];

  };
}
