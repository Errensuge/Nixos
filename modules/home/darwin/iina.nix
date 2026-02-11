{ lib, config, ... }:
with lib;
let
  cfg = config.home.homebrew.iina;
in
{
  options.home.homebrew.iina = {
    enable = mkEnableOption "System iina homebrew service";
  };
  config = mkIf cfg.enable {

    homebrew.casks = [
      "iina"
    ];

  };
}
