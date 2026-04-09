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
      rustup
    ];

    home.sessionVariables = {
      CARGO_HOME = "${config.home.sessionVariables.XDG_DATA_HOME}/cargo";
      RUSTUP_HOME = "${config.home.sessionVariables.XDG_DATA_HOME}/rustup";
    };

  };
}
