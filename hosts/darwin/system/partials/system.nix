{ self, ... }:
{
  # Add ability to use TouchID for sudo
  security.pam.services.sudo_local.touchIdAuth = true;

  system = {
    stateVersion = 6;
    configurationRevision = self.rev or self.dirtyRev or null;
    defaults = {
      controlcenter.BatteryShowPercentage = true;
      dock = {
        show-recents = false;
        tilesize = 30;
        autohide = false;
        orientation = "bottom";
      };
      finder = {
        ShowHardDrivesOnDesktop = false;
        ShowMountedServersOnDesktop = false;
        ShowExternalHardDrivesOnDesktop = false;
        ShowRemovableMediaOnDesktop = false;
        FXRemoveOldTrashItems = true;
        NewWindowTarget = "Home";
      };
      loginwindow = {
        GuestEnabled = false;
      };
    };
  };
}
