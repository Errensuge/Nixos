{ pkgs, ... }:
{
  services.flatpak.packages = [
    "io.github.flattool.Warehouse"
  ];

  environment.systemPackages = with pkgs; [
    zed-editor
  ];
}
