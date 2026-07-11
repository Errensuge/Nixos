{ pkgs, import-tree, ... }:
{
  home-manager.users.alistreaza = {
    imports = [
      (import-tree ../../../../modules/home/common)
      (import-tree ../../../../modules/home/nixos)
    ];

    home = {
      username = "alistreaza";
      homeDirectory = "/home/alistreaza";
    };

    # Gnome
    home.xdg.enable = true;
    home.shells.gnome.enable = true;

    # Shell apps
    home.shell.nh.enable = true;
    home.shell.zsh.enable = true;
    home.shell.git.enable = true;
    home.shell.neovim.enable = true;

    # Code editor
    home.env.nix.enable = true;

    # Terminal Apps
    home.ghostty.enable = true;

    # Firefox app
    home.firefox.enable = true;
    home.firefox.privacy = true;

    home.packages = with pkgs; [
      zed-editor
    ];

    # The state version is required and should stay at the version you
    # originally installed.
    home.stateVersion = "26.05";
  };
}
