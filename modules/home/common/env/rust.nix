{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.home.env.rust;
in
{
  options.home.env.rust = {
    enable = mkEnableOption "Zen Editor options";
  };
  config = mkIf cfg.enable {

    home.packages = with pkgs; [
      rustup
    ];

  };
}
