{ pkgs, ... }:
{
  home.packages = with pkgs; [

    zed-editor

    # Languages servers
    nil
    nixd

  ];
}
