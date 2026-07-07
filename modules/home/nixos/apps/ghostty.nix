{ lib, config, ... }:
with lib;
let
  cfg = config.home.ghostty;
in
{
  options.home.ghostty = {
    enable = mkEnableOption "Ghostty service";
  };
  config = mkIf cfg.enable {

    programs.ghostty = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        background-opacity = 0.9;
        keybind = [
          "performable:ctrl+c=copy_to_clipboard"
          "performable:ctrl+v=paste_from_clipboard"
        ];
      };
    };

  };
}
