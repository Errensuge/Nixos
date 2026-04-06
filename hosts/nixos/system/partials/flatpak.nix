{ ... }:
{
  services.flatpak.enable = true;
  services.flatpak.update.auto = {
    enable = true;
    onCalendar = "weekly"; # Default value
  };

  services.flatpak.packages = [
    "io.github.flattool.Warehouse"
  ];
}
