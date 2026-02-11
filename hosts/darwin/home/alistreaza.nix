{ import-tree, ... }:
{
  home-manager.users.alistreaza = {
    imports = [
      (import-tree ../../../modules/home/common)
    ];

    home = {
      username = "alistreaza";
      homeDirectory = /Users/alistreaza;
    };

    # Shell apps
    user.shell.zsh.enable = true;
    user.shell.git.enable = true;
    user.shell.neovim.enable = true;
    user.shell.nh.enable = true;
    user.shell.devenv.enable = true;

    # No Home Application Folders
    targets.darwin.linkApps.enable = false;
    targets.darwin.copyApps.enable = false;

    # The state version is required and should stay at the version you
    # originally installed.
    home.stateVersion = "25.11";
  };
}
