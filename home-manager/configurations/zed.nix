{
  lib,
  pkgs,
  config,
  ...
}:
with lib;
let
  cfg = config.within.zed;
in
{
  options.within.zed = {
    enable = mkEnableOption "System zed service";
  };
  config = mkIf cfg.enable {
    environment = {
      systemPackages = with pkgs; [

        # Nix languages parser
        nil
        nixd

        # Zed Editor
        zed-editor

      ];
    };

  };
}
