{ lib, config, ... }:
with lib;
let
  cfg = config.os.homebrew.jetbrain.intellij;
in
{
  options.os.homebrew.jetbrain.intellij = {
    enable = mkEnableOption "System jetbrain homebrew service";
  };
  config = mkIf cfg.enable {

    homebrew.casks = [
      "intellij-idea"
    ];

  };
}
