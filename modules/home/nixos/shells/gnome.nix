{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.home.shells.gnome;
in
{
  options.home.shells.gnome = {
    enable = mkEnableOption "Gnome service";
    extensions = {
      paperwm = mkOption {
        type = types.bool;
        default = true;
        description = "Enable the PaperWM extension.";
      };

      app-hider = mkOption {
        type = types.bool;
        default = true;
        description = "Enable the App Hider extension.";
      };

      dash-to-panel = mkOption {
        type = types.bool;
        default = true;
        description = "Enable the Dash to Panel extension.";
      };

    };
  };
  config = mkIf cfg.enable {

    home.packages = mkMerge [
      [
        pkgs.numix-icon-theme
        pkgs.numix-icon-theme-square
      ]
      (mkIf cfg.extensions.paperwm [ pkgs.gnomeExtensions.paperwm ])
      (mkIf cfg.extensions.app-hider [ pkgs.gnomeExtensions.app-hider ])
      (mkIf cfg.extensions.dash-to-panel [ pkgs.gnomeExtensions.dash-to-panel ])
    ];

    dconf = {
      enable = true;
      settings = mkMerge [
        {
          # We define the input sources to use the French layout with Mac keyboard variant.
          "org/gnome/desktop/input-sources" = {
            sources = [
              (lib.hm.gvariant.mkTuple [
                "xkb"
                "fr+mac"
              ])
            ];
          };

          # We define the interface settings to use a teal accent color and prefer dark color scheme.
          "org/gnome/desktop/interface" = {
            accent-color = "teal";
            icon-theme = "Numix-Square";
            color-scheme = "prefer-dark";
          };

          "org/gnome/desktop/wm/preferences" = {
            button-layout = "appmenu:maximize,minimize,close";
          };

          # We define the shell settings to enable user extensions
          # and enable the PaperWM, App Hider, and Dash to Panel extensions if they are enabled in the configuration.
          "org/gnome/shell" = {
            disable-user-extensions = false;
            enabled-extensions =
              with pkgs.gnomeExtensions;
              mkMerge [
                (mkIf cfg.extensions.paperwm [ paperwm.extensionUuid ])
                (mkIf cfg.extensions.app-hider [ app-hider.extensionUuid ])
                (mkIf cfg.extensions.dash-to-panel [ dash-to-panel.extensionUuid ])
              ];
          };
        }
        (mkIf cfg.extensions.app-hider {
          "org/gnome/shell/extensions/app-hider" = {
            hidden-apps = [
              "nvim.desktop"
              "cups.desktop"
              "xterm.desktop"
              "nixos-manual.desktop"
            ];
          };
        })
        (mkIf cfg.extensions.dash-to-panel {
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
        })
        (mkIf cfg.extensions.paperwm {
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
        })
      ];
    };
  };
}
