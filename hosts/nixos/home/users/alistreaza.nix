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

    # Shell apps
    home.shell.zsh.enable = true;
    home.shell.git.enable = true;
    home.shell.neovim.enable = true;

    home.shell.nh.enable = true;
    home.shell.env.enable = true;

    # Code editor
    home.ide.zed.enable = true;

    # Markdown Editor
    home.md.obsidian.enable = true;

    # The state version is required and should stay at the version you
    # originally installed.
    home.stateVersion = "25.11";
  };
}
