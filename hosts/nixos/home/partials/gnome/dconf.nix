{
  lib,
  pkgs,
  ...
}:
with lib.hm.gvariant;
{
  dconf = {
    enable = true;
    settings = {

      "org/gnome/desktop/input-sources" = {
        sources = [
          (mkTuple [
            "xkb"
            "fr+mac"
          ])
        ];
      };

      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = with pkgs.gnomeExtensions; [
          vitals.extensionUuid
          paperwm.extensionUuid
          app-hider.extensionUuid
          dash-to-panel.extensionUuid
        ];
      };

      "org/gnome/desktop/wm/preferences" = {
        button-layout = "appmenu:minimize,close";
      };

      "org/gnome/shell/extensions/app-hider" = {
        hidden-apps = [
          "nvim.desktop"
          "cups.desktop"
          "xterm.desktop"
          "nixos-manual.desktop"
        ];
      };

      "org/gnome/desktop/interface" = {
        icon-theme = "Papirus";
        accent-color = "teal";
        color-scheme = "prefer-dark";
      };

      "org/gnome/desktop/background" = {
        picture-options = "zoom";
        picture-uri = "file://" + ./wallpapers/mocha.svg;
        picture-uri-dark = "file://" + ./wallpapers/mocha.svg;
      };

      "org/gnome/shell/extensions/dash-to-panel" = {
        prefs-opened = true;

        isolate-monitors = true;
        isolate-workspaces = true;

        panel-top-bottom-padding = 8;

        trans-panel-opacity = 0.75;
        trans-use-border = true;
        trans-use-custom-opacity = true;

        dot-color-dominant = true;
        dot-color-override = false;
        dot-color-unfocused-different = false;
        dot-position = "BOTTOM";
        dot-style-focused = "METRO";
        dot-style-unfocused = "DOTS";

        focus-highlight = true;
        focus-highlight-dominant = true;

        hide-overview-on-startup = true;
      };

      "org/gnome/shell/extensions/paperwm" = {
        show-window-position-bar = false;
      };

      "org/gnome/shell/extensions/vitals" = {
        show-gpu = true;
        show-voltage = false;
        position-in-panel = 1;
      };

      "org/gnome/shell/extensions/paperwm/workspaces" = {
        list = [
          "personal"
          "university"
        ];
      };

      "org/gnome/shell/extensions/paperwm/workspaces/personal" = {
        name = "Personel";
        index = 0;
        background = "file://" + ./wallpapers/mocha.svg;
      };

      "org/gnome/shell/extensions/paperwm/workspaces/university" = {
        name = "Université";
        index = 1;
        background = "file://" + ./wallpapers/frappe.svg;
      };

    };
  };
}
