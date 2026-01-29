{
  nixpkgs,
  nixpkgs-unstable,
  ...
}:
{
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (nixpkgs.lib.getName pkg) [
      "nvidia-x11"
    ];

  nixpkgs.overlays = [
    (final: prev: {
      unstable = import nixpkgs-unstable {
        system = prev.system;
        config.allowUnfreePredicate =
          pkg:
          builtins.elem (nixpkgs-unstable.lib.getName pkg) [
            "idea"
            "clion"
            "rider"
            "goland"
            "pycharm"
            "webstorm"
            "phpstorm"
            "datagrip"
            "dataspell"
            "ruby-mine"
            "rust-rover"
          ];
      };
    })
  ];

}
