{ lib, config, ... }:
with lib;
let
  cfg = config.os.homebrew.jetbrain.clion;
in
{
  options.os.homebrew.jetbrain.clion = {
    enable = mkEnableOption "System jetbrain homebrew service";
  };
  config = mkIf cfg.enable {

    homebrew.casks = [
      "clion"
    ];

  };
}
