{ import-tree, ... }:
{
  home-manager.users.alistreaza = {
    imports = [
      (import-tree ../../../modules/home/common)
      (import-tree ../../../modules/home/nixos)
    ];

    home = {
      username = "alistreaza";
      homeDirectory = "/home/alistreaza";
    };

    # Shell apps
    user.shell.zsh.enable = true;
    user.shell.git.enable = true;
    user.shell.neovim.enable = true;
    user.shell.nh.enable = true;
    user.shell.devenv.enable = true;

    # Code editor
    user.ide.zed.enable = true;

    # IDE Jetbrains
    user.ide.jetbrains.idea.enable = false;
    user.ide.jetbrains.pycharm.enable = false;
    user.ide.jetbrains.phpstorm.enable = false;
    user.ide.jetbrains.rustrover.enable = false;

    # IDE Data Jetbrains
    user.ide.jetbrains.datagrip.enable = false;
    user.ide.jetbrains.dataspell.enable = false;

    # Markdown Editor
    user.editor.obsidian.enable = false;

    # The state version is required and should stay at the version you
    # originally installed.
    home.stateVersion = "25.11";
  };
}
