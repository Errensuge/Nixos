{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pods
    zed-editor
  ];
}
