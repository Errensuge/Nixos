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
    home.shell.devenv.enable = true;

    # Code editor
    home.ide.zed.enable = true;

    # IDE Jetbrains
    home.ide.jetbrains.idea.enable = true;
    home.ide.jetbrains.pycharm.enable = true;
    home.ide.jetbrains.phpstorm.enable = true;
    home.ide.jetbrains.rustrover.enable = true;
    home.ide.jetbrains.goland.enable = true;

    # IDE Data Jetbrains
    home.ide.jetbrains.datagrip.enable = true;
    home.ide.jetbrains.dataspell.enable = true;

    # Markdown Editor
    home.md.obsidian.enable = true;

    # The state version is required and should stay at the version you
    # originally installed.
    home.stateVersion = "25.11";
  };
}
