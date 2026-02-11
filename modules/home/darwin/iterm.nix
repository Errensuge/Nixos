{ lib, config, ... }:
with lib;
let
  cfg = config.home.homebrew.iterm;
in
{
  options.home.homebrew.iterm = {
    enable = mkEnableOption "System iterm homebrew service";
  };
  config = mkIf cfg.enable {

    homebrew.casks = [
      "iterm2"
    ];

  };
}
