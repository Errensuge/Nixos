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
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      oh-my-zsh = {
        enable = true;
        theme = "af-magic";
      };
    };

  };
}
