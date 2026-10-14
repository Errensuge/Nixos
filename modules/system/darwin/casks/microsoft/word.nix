{ lib, config, ... }:
with lib;
let
  cfg = config.os.homebrew.microsoft.word;
in
{
  options.os.homebrew.microsoft.word = {
    enable = mkEnableOption "System microsoft homebrew service";
  };
  config = mkIf cfg.enable {

    homebrew.casks = [
      "microsoft-word"
    ];

  };
}
