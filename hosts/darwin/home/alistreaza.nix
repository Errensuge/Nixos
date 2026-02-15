{ import-tree, ... }:
{
  home-manager.users.alistreaza = {
    imports = [
      (import-tree ../../../modules/home/common)
      (import-tree ./partials)
    ];

    home = {
      username = "alistreaza";
      homeDirectory = /Users/alistreaza;
    };

    # Shell apps
    home.shell.nh.enable = true;
    home.shell.zsh.enable = true;
    home.shell.git.enable = true;
    home.shell.neovim.enable = true;

    # Nix env deps
    home.env.nix.enable = true;

    # Languages env deps
    home.env.r.enable = true;
    home.env.jdk.enable = true;
    home.env.rust.enable = true;
    home.env.python.enable = true;

    # No Home Application Folders
    targets.darwin.linkApps.enable = false;
    targets.darwin.copyApps.enable = false;

    # The state version is required and should stay at the version you
    # originally installed.
    home.stateVersion = "25.11";
  };
}
