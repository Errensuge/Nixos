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

    services.paneru = {
      enable = true;
      # Equivalent to what you would put into `~/.paneru` (See Configuration options below).
      settings = {
        options = {
          preset_column_widths = [
            0.25
            0.33
            0.5
            0.66
            0.75
          ];
          swipe_gesture_fingers = 4;
          animation_speed = 4000;
        };
        bindings = {
          window_focus_west = "cmd - h";
          window_focus_east = "cmd - l";
          window_focus_north = "cmd - k";
          window_focus_south = "cmd - j";
          window_swap_west = "alt - h";
          window_swap_east = "alt - l";
          window_swap_first = "alt + shift - h";
          window_swap_last = "alt + shift - l";
          window_center = "alt - c";
          window_resize = "alt - r";
          window_fullwidth = "alt - f";
          window_manage = "ctrl + alt - t";
          window_stack = "alt - ]";
          window_unstack = "alt + shift - ]";
          quit = "ctrl + alt - q";
        };
        windows.all = {
          title = ".*";
          vertical_padding = 5;
          horizontal_padding = 5;
        };
      };
    };

    # The state version is required and should stay at the version you
    # originally installed.
    home.stateVersion = "25.11";
  };
}
