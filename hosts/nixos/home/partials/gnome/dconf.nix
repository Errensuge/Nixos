{
  lib,
  pkgs,
  ...
}:
with lib.hm.gvariant;
{
  home.packages = with pkgs; [
    papirus-icon-theme
    gnomeExtensions.paperwm
    gnomeExtensions.app-hider
    gnomeExtensions.dash-to-panel
  ];

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
          paperwm.extensionUuid
          app-hider.extensionUuid
          dash-to-panel.extensionUuid
        ];
      };

      "org/gnome/desktop/wm/preferences" = {
        button-layout = "appmenu:maximize,minimize,close";
      };

      "org/gnome/shell/extensions/app-hider" = {
        hidden-apps = [
          "nvim.desktop"
          "cups.desktop"
          "xterm.desktop"
          "nixos-manual.desktop"
          "org.gnome.Loupe.desktop"
        ];
      };

      "org/gnome/desktop/interface" = {
        icon-theme = "Papirus";
        accent-color = "teal";
        color-scheme = "prefer-dark";
      };

      "org/gnome/desktop/background" = {
        picture-options = "zoom";
        picture-uri = "file://" + ./walls.jpg;
        picture-uri-dark = "file://" + ./walls.jpg;
      };

      "org/gnome/shell/extensions/dash-to-panel" = {
        prefs-opened = false;

        isolate-monitors = true;
        isolate-workspaces = true;

        appicon-margin = 2;
        appicon-padding = 12;

        trans-panel-opacity = 0.75;

        trans-use-border = true;
        trans-use-custom-opacity = true;

        dot-color-dominant = true;
        dot-color-override = false;
        dot-color-unfocused-different = false;

        dot-position = "BOTTOM";
        dot-style-focused = "METRO";
        dot-style-unfocused = "SQUARES";

        panel-top-bottom-margins = 0;
        panel-top-bottom-padding = 0;

        focus-highlight = false;
        focus-highlight-dominant = true;

        highlight-appicon-hover = true;
        hide-overview-on-startup = true;
      };

      "org/gnome/shell/extensions/paperwm" = {
        show-window-position-bar = false;
        show-workspace-indicator = false;
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
      };

      "org/gnome/shell/extensions/paperwm/workspaces/university" = {
        name = "Université";
        index = 1;
      };

    };
  };
}
