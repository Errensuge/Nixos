{ lib, config, ... }:
with lib;
let
  cfg = config.home.homebrew.microsoft;
in
{
  options.home.homebrew.microsoft = {
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
