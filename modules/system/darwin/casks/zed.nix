{ lib, config, ... }:
with lib;
let
  cfg = config.os.homebrew.zed;
in
{
  options.os.homebrew.zed = {
    enable = mkEnableOption "System zed homebrew service";
  };
  config = mkIf cfg.enable {

    homebrew.casks = [
      "zed"
    ];

  };
}
