{
  lib,
  config,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.os.steam;
in
{
  options.os.steam = {
    enable = mkEnableOption "System pipewire service";
  };
  config = mkIf cfg.enable {

    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };

    programs.gamemode.enable = true;

  };
}
