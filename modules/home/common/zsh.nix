{ lib, config, ... }:
with lib;
let
  cfg = config.user.shell.zsh;
in
{
  options.user.shell.zsh = {
    enable = mkEnableOption "System zsh service";
  };
  config = mkIf cfg.enable {

    programs.zsh = {
      enable = true;
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
