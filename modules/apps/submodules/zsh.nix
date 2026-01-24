{ lib, config, ... }:
with lib;
let
  cfg = config.within.shell.zsh;
in
{
  options.within.shell.zsh = {
    enable = mkEnableOption "System zsh service";
  };
  config = mkIf cfg.enable {

    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
    };

    programs.neovim = {
      enable = true;
      defaultEditor = true;
    };

  };
}
