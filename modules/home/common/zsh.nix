{ lib, config, ... }:
with lib;
let
  cfg = config.home.shell.zsh;
in
{
  options.home.shell.zsh = {
    enable = mkEnableOption "System zsh service";
  };
  config = mkIf cfg.enable {

    programs.zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      dotDir = "${config.xdg.configHome}/zsh";
      history = {
        path = "${config.xdg.dataHome}/zsh/history";
      };
      oh-my-zsh = {
        enable = true;
        theme = "dieter";
      };
    };

  };
}
