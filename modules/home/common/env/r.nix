{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.home.env.r;
in
{
  options.home.env.r = {
    enable = mkEnableOption "Zen Editor options";
  };
  config = mkIf cfg.enable {

    home.packages = with pkgs; [
      R
    ];

  };
}
