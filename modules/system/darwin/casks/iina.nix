{ lib, config, ... }:
with lib;
let
  cfg = config.os.homebrew.iina;
in
{
  options.os.homebrew.iina = {
    enable = mkEnableOption "System iina homebrew service";
  };
  config = mkIf cfg.enable {

    homebrew.casks = [
      "iina"
    ];

  };
}
