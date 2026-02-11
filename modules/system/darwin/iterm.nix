{ lib, config, ... }:
with lib;
let
  cfg = config.os.homebrew.iterm;
in
{
  options.os.homebrew.iterm = {
    enable = mkEnableOption "System iterm homebrew service";
  };
  config = mkIf cfg.enable {

    homebrew.casks = [
      "iterm2"
    ];

  };
}
