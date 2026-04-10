{ ... }:
{
  os.flatpak.enable = true;
  services.flatpak.packages = [
    "io.github.flattool.Warehouse"
  ];
}
