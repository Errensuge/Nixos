{
  lib,
  pkgs,
  ...
}:
with lib.hm.gvariant;
{
  home.packages = with pkgs; [
    papirus-icon-theme
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
          dash-to-dock.extensionUuid
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

      "org/gnome/shell/extensions/dash-to-dock" = {
        apply-custom-theme = false;
        transparency-mode = "FIXED";
        background-opacity = 0.45;
        background-color = "rgb(0,0,0)";
        custom-background-color = false;
        custom-theme-shrink = false;
        dash-max-icon-size = 35;
        disable-overview-on-startup = true;
        dock-fixed = true;
        dock-position = "LEFT";
        extend-height = true;
        icon-size-fixed = true;
        show-apps-at-top = false;
        show-running = true;
        show-favorites = true;
        show-mounts = false;
        show-trash = false;
        show-windows-preview = false;
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
