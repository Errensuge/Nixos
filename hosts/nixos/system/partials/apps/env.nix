{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    pods
    zed-editor
  ];
}
