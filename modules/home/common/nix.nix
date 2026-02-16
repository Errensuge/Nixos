{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.home.env.nix;
in
{
  options.home.env.nix = {
    enable = mkEnableOption "Zen Editor options";
  };
  config = mkIf cfg.enable {

    home.packages = with pkgs; [
      nil
      nixd
    ];

  };
}
