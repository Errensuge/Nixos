{ lib, config, ... }:
with lib;
let
  cfg = config.home.homebrew.zen;
in
{
  options.home.homebrew.zen = {
    enable = mkEnableOption "System zen homebrew service";
  };
  config = mkIf cfg.enable {

    homebrew.casks = [
      "zen"
    ];

  };
}
