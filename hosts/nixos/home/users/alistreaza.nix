{ import-tree, ... }:
{
  home-manager.users.alistreaza = {
    imports = [
      (import-tree ../../../../modules/home/common)
      (import-tree ../../../../modules/home/nixos)
      (import-tree ../partials)
    ];

    home = {
      username = "alistreaza";
      homeDirectory = "/home/alistreaza";
    };

    home.xdg.enable = true;

    # Shell apps
    home.shell.nh.enable = true;
    home.shell.zsh.enable = true;
    home.shell.git.enable = true;
    home.shell.neovim.enable = true;

    # Terminal app
    home.ghostty.enable = true;

    # Code editor
    home.env.nix.enable = true;

    # The state version is required and should stay at the version you
    # originally installed.
    home.stateVersion = "25.11";
  };
}
