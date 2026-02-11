{ lib, config, ... }:
with lib;
let
  cfg = config.home.shell.neovim;
in
{
  options.home.shell.neovim = {
    enable = mkEnableOption "System neovim service";
  };
  config = mkIf cfg.enable {

    programs.neovim = {
      enable = true;
      defaultEditor = true;
    };

  };
}
