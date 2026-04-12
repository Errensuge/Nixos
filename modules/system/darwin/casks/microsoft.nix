{ lib, config, ... }:
with lib;
let
  cfg = config.os.homebrew.microsoft;
in
{
  options.os.homebrew.microsoft = {
    enable = mkEnableOption "System microsoft homebrew service";
  };
  config = mkIf cfg.enable {

    homebrew.casks = [
      "microsoft-word"
      "microsoft-excel"
      "microsoft-powerpoint"
      "microsoft-teams"
    ];

  };
}
