{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.home.env.shell;
in
{
  options.home.env.shell = {
    enable = mkEnableOption "Zen Editor options";
  };
  config = mkIf cfg.enable {

    home.packages = with pkgs; [
      devenv
    ];

  };
}
