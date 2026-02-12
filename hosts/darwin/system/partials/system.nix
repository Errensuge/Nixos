{ self, ... }:
{
  # Add ability to use TouchID for sudo
  security.pam.services.sudo_local.touchIdAuth = true;

  system = {
    stateVersion = 6;
    configurationRevision = self.rev or self.dirtyRev or null;
    defaults = {
      loginwindow = {
        GuestEnabled = false;
      };
      dock = {
        minimize-to-application = true;
        show-recents = false;
        tilesize = 30;
        autohide = false;
        orientation = "bottom";
        persistent-apps = [
          { app = "/Applications/Zen.app"; }
          { app = "/System/Applications/Mail.app"; }
          { app = "/Applications/Obsidian.app"; }
          { app = "/Applications/Microsoft Word.app"; }
          { app = "/Applications/Microsoft Excel.app"; }
          { app = "/Applications/Microsoft PowerPoint.app"; }
          { app = "/Applications/Microsoft Teams.app"; }
          { app = "/Applications/Zed.app"; }
          { app = "/Applications/IntelliJ IDEA.app"; }
          { app = "/Applications/PyCharm.app"; }
          { app = "/Applications/PhpStorm.app"; }
          { app = "/Applications/RustRover.app"; }
          { app = "/Applications/CLion.app"; }
          { app = "/Applications/GoLand.app"; }
          { app = "/Applications/DataGrip.app"; }
          { app = "/Applications/DataSpell.app"; }
          { app = "/Applications/iTerm.app"; }
        ];
        persistent-others= [];
        wvous-bl-corner = 1;
        wvous-br-corner = 3;
        wvous-tl-corner = 1;
        wvous-tr-corner = 1;
      };
      finder = {
        ShowHardDrivesOnDesktop = false;
        ShowMountedServersOnDesktop = false;
        ShowExternalHardDrivesOnDesktop = false;
        ShowRemovableMediaOnDesktop = false;
        FXRemoveOldTrashItems = true;
        NewWindowTarget = "Home";
      };
      WindowManager = {
        # Stage
        HideDesktop = false;
        GloballyEnabled = false;
        StageManagerHideWidgets = true;
        # Desktop
        StandardHideWidgets = true;
        StandardHideDesktopIcons = true;
        EnableStandardClickToShowDesktop = false;
      };
      menuExtraClock.IsAnalog = false;
      controlcenter.BatteryShowPercentage = true;
    };
  };
}
