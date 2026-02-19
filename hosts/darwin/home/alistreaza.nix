{ import-tree, ... }:
{
  home-manager.users.alistreaza = {
    imports = [
      (import-tree ../../../modules/home/common)
      (import-tree ../../../modules/home/darwin)
    ];

    home = {
      username = "alistreaza";
      homeDirectory = /Users/alistreaza;
      sessionVariables = {
        XDG_CACHE_HOME = "$HOME/.cache";
        XDG_CONFIG_HOME = "$HOME/.config";
        XDG_DATA_HOME = "$HOME/.local/share";
        XDG_STATE_HOME = "$HOME/.local/state";
      };
    };

    home.file = {
      ".config/ghostty/" = {
        source = ./config/ghostty;
      };
    };

    # Shell apps
    home.shell.nh.enable = true;
    home.shell.zsh.enable = true;
    home.shell.git.enable = true;
    home.shell.neovim.enable = true;

    # Nix & languages env deps
    home.env.nix.enable = true;
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
