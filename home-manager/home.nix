{
  inputs,
  ...
}:
{
  imports = [
    ./configurations/gnome.nix
    ./configurations/firefox.nix
    ./configurations/ghostty.nix
    ./configurations/zed.nix
  ];

  nixpkgs = {
    overlays = [
      inputs.self.overlays.additions
      inputs.self.overlays.modifications
      inputs.self.overlays.unstable-packages
    ];
  };

  home = {
    username = "alistreaza";
    homeDirectory = "/home/alistreaza";
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "25.11";
}
