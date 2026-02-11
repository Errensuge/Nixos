{ lib, config, ... }:
with lib;
let
  cfg = config.home.homebrew.zed;
in
{
  options.home.homebrew.zed = {
    enable = mkEnableOption "System zed homebrew service";
  };
  config = mkIf cfg.enable {

    homebrew.casks = [
      "zed"
    ];

  };
}
