{ ... }:
{
  home-manager.users.alistreaza = {

    home = {
      username = "alistreaza";
      homeDirectory = /Users/alistreaza;
    };

    # No Home Application Folders
    targets.darwin.linkApps.enable = false;
    targets.darwin.copyApps.enable = false;

    # Apps
    home.shell.zsh = true;
    home.shell.git = true;

    # Homebrew apps
    home.homebrew.iterm = true;
    home.homebrew.zed = true;
    home.homebrew.jetbrain = true;

    home.homebrew.iina = true;
    home.homebrew.zen = true;
    home.homebrew.obsidian = true;
    home.homebrew.microsoft = true;

    home.homebrew.keka = true;

    # The state version is required and should stay at the version you
    # originally installed.
    home.stateVersion = "25.11";
  };
}
