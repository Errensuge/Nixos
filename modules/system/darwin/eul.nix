{ lib, config, ... }:
with lib;
let
  cfg = config.os.homebrew.eul;
in
{
  options.os.homebrew.eul = {
    enable = mkEnableOption "System iina homebrew service";
  };
  config = mkIf cfg.enable {

    homebrew.casks = [
      "eul"
    ];

  };
}
