{ import-tree, ... }:
{
  home-manager.users.alistreaza = {

    imports = [
      (import-tree ./options)
      (import-tree ./partials)
    ];

    home = {
      username = "alistreaza";
      homeDirectory = "/home/alistreaza";
    };

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

    home.stateVersion = "25.11";
  };
}
