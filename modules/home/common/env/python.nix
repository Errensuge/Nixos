{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.home.env.python;
in
{
  options.home.env.python = {
    enable = mkEnableOption "Zen Editor options";
  };
  config = mkIf cfg.enable {

    home.packages = with pkgs; [
      python3
      uv
    ];

  };
}
