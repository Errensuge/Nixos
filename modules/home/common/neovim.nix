{ lib, config, ... }:
with lib;
let
  cfg = config.user.shell.neovim;
in
{
  options.user.shell.neovim = {
    enable = mkEnableOption "System neovim service";
  };
  config = mkIf cfg.enable {

    programs.neovim = {
      enable = true;
      defaultEditor = true;
    };

  };
}
