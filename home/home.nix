{
  inputs,
  ...
}:
{
  imports = [

    # App configurations
    ./configurations/gnome.nix
    ./configurations/firefox.nix
    ./configurations/ghostty.nix

    # Modules
    inputs.self.home

  ];

  within.home.zed.enable = true;
  within.home.jetbrains.enable = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "25.11";
}
