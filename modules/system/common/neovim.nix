{ lib, config, ... }:
with lib;
let
  cfg = config.os.shell.neovim;
in
{
  options.os.shell.neovim = {
    enable = mkEnableOption "System neovim service";
  };
  config = mkIf cfg.enable {

    programs.neovim = {
      enable = true;
      defaultEditor = true;
    };

  };
}
