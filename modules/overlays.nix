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
            "pycharm"
          ];
      };
    })
  ];

}
