{ lib, config, ... }:
with lib;
let
  cfg = config.os.homebrew.jetbrain.rubymine;
in
{
  options.os.homebrew.jetbrain.rubymine = {
    enable = mkEnableOption "System jetbrain homebrew service";
  };
  config = mkIf cfg.enable {

    homebrew.casks = [
      "rubymine"
    ];

  };
}
