{ import-tree, ... }:
{
  home-manager.users.alistreaza = {

    imports = [
      (import-tree ../../common)
    ];

    home = {
      username = "alistreaza";
      homeDirectory = "/home/alistreaza";
    };

    # Apps
    home.shell.zsh = true;
    home.shell.git = true;

    # Code editor
    home.ide.zed.enable = true;

    # IDE Jetbrains
    home.ide.jetbrains.idea.enable = false;
    home.ide.jetbrains.pycharm.enable = false;
    home.ide.jetbrains.phpstorm.enable = false;
    home.ide.jetbrains.rustrover.enable = false;

    # IDE Data Jetbrains
    home.ide.jetbrains.datagrip.enable = false;
    home.ide.jetbrains.dataspell.enable = false;

    # Markdown Editor
    home.editor.obsidian.enable = false;

    # The state version is required and should stay at the version you
    # originally installed.
    home.stateVersion = "25.11";
  };
}
