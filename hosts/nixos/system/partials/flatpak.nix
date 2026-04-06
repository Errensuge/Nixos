{ ... }:
{
  services.flatpak.enable = true;
  services.flatpak.update.auto = {
    enable = true;
    onCalendar = "weekly"; # Default value
  };

  services.flatpak.packages = [
    "io.github.flattool.Warehouse"
    "org.gnome.Papers"
    "org.gnome.Loupe"
    "org.gnome.Showtime"
    "io.github.alainm23.planify"
  ];
}
