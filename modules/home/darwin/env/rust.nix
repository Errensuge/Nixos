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
    enable = mkEnableOption "System nh service";
  };
  config = mkIf cfg.enable {

    home.packages = with pkgs; [
      rust-bin.stable.latest.default.override
      {
        extensions = [ "rust-src" ];
      }
    ];

  };
}
