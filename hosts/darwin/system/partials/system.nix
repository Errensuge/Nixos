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
        orientation = "left";
        persistent-others = [ ];
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
        EnableStandardClickToShowDesktop = false;
      };
      menuExtraClock.IsAnalog = false;
      controlcenter.BatteryShowPercentage = true;
    };
  };
}
