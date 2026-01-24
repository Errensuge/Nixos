{ lib, config, ... }:
with lib;
let
  cfg = config.within.audio.pipewire;
in
{
  options.within.audio.pipewire = {
    enable = mkEnableOption "System pipewire service";
  };
  config = mkIf cfg.enable {

    security.rtkit.enable = true;
    services.pulseaudio.enable = false;

    services.pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
      alsa.support32Bit = true;
    };

  };
}
