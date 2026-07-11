{ lib, config, ... }:
with lib;
let
  cfg = config.home.firefox;
in
{
  options.home.firefox = {
    enable = mkEnableOption "Firefox service";
    privacy = mkEnableOption "Firefox privacy service";
    sanity = mkEnableOption "Sanitize Firefox on shutdown";
  };
  config = mkIf cfg.enable {

    xdg.mimeApps.defaultApplications = {
      "text/html" = [ "firefox.desktop" ];
      "text/xml" = [ "firefox.desktop" ];
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];
    };

    programs.firefox = {
      enable = true;
      languagePacks = [ "fr-FR" ];
      policies = mkMerge [
        {
          DisablePocket = true;
          ExtensionSettings = mkIf cfg.privacy {
            "uBlock0@raymondhill.net" = {
              default_area = "menupanel";
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
              installation_mode = "force_installed";
              private_browsing = true;
            };
          };
        }
        (mkIf cfg.privacy {
          DisableTelemetry = true;
          DisableFirefoxStudies = true;
          EnableTrackingProtection = true;
        })
      ];
      profiles.default = {
        settings = mkMerge [
          {
            # Vertical tabs
            "sidebar.revamp" = true;
            "sidebar.verticalTabs" = true;
            "sidebar.new-sidebar.has-used" = true;
            "sidebar.main.tools" = "history,passwords";
            "sidebar.backupState" = {
              "panelOpen" = true;
              "launcherExpanded" = false;
              "launcherVisible" = true;
            };
            # No bookmarks
            "browser.toolbars.bookmarks.visibility" = "never";
            # New tab page
            "browser.newtabpage.activity-stream.feeds.topsites" = false;
            "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
            "browser.newtabpage.activity-stream.showSponsoredCheckboxes" = false;
          }
          (mkIf cfg.privacy {
            # Disable some telemetry
            "app.shield.optoutstudies.enabled" = false;
            "browser.discovery.enabled" = false;
            "browser.newtabpage.activity-stream.feeds.telemetry" = false;
            "browser.newtabpage.activity-stream.telemetry" = false;
            "browser.ping-centre.telemetry" = false;
            "datareporting.healthreport.service.enabled" = false;
            "datareporting.healthreport.uploadEnabled" = false;
            "datareporting.policy.dataSubmissionEnabled" = false;
            "datareporting.sessions.current.clean" = true;
            "devtools.onboarding.telemetry.logged" = false;
            "toolkit.telemetry.archive.enabled" = false;
            "toolkit.telemetry.bhrPing.enabled" = false;
            "toolkit.telemetry.enabled" = false;
            "toolkit.telemetry.firstShutdownPing.enabled" = false;
            "toolkit.telemetry.hybridContent.enabled" = false;
            "toolkit.telemetry.newProfilePing.enabled" = false;
            "toolkit.telemetry.prompted" = 2;
            "toolkit.telemetry.rejected" = true;
            "toolkit.telemetry.reportingpolicy.firstRun" = false;
            "toolkit.telemetry.server" = "";
            "toolkit.telemetry.shutdownPingSender.enabled" = false;
            "toolkit.telemetry.unified" = false;
            "toolkit.telemetry.unifiedIsOptIn" = false;
            "toolkit.telemetry.updatePing.enabled" = false;
          })
          (mkIf cfg.sanity {
            # Sanitize
            "SanitizeOnShutdown" = {
              "Locked" = false;
              "Cache" = true;
              "History" = true;
              "Cookies" = true;
              "Sessions" = true;
              "FormData" = true;
              "SiteSettings" = true;
            };
          })
        ];
      };
    };
  };
}
