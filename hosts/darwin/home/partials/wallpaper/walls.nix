{
  config,
  ...
}:
let
  wallpaperPath = "${config.home.homeDirectory}/.config/wallpaper/current-wallpaper.jpg";
in
{
  # Create wallpaper directory and download wallpaper
  home.file.".config/wallpaper/current-wallpaper.jpg" = {
    source = ./walls.jpg;
  };

  # Set wallpaper using activation script
  home.activation.setWallpaper = config.lib.dag.entryAfter [ "writeBoundary" ] ''
    # Set wallpaper for all desktops using osascript
    $DRY_RUN_CMD /usr/bin/osascript -e "tell application \"System Events\" to tell every desktop to set picture to \"${wallpaperPath}\""
  '';
}
