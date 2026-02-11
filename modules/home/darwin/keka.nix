{ lib, config, ... }:
with lib;
let
  cfg = config.home.homebrew.keka;
in
{
  options.home.homebrew.keka = {
    enable = mkEnableOption "System keka homebrew service";
  };
  config = mkIf cfg.enable {

    homebrew.casks = [
      "keka"
    ];

  };
}
