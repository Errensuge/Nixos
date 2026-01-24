{ lib, config, ... }:
with lib;
let
  cfg = config.within.keyboard.apple;
in
{
  options.within.keyboard.apple = {
    enable = mkEnableOption "System apple locales service";
  };
  config = mkIf cfg.enable {

    # Select internationalisation properties.
    i18n.defaultLocale = "fr_BE.UTF-8";

    # Configure console keymap
    console.keyMap = "mac-fr";

    # Configure keymap in X11
    services.xserver.xkb = {
      model = "macintosh";
      layout = "fr";
    };

  };
}
