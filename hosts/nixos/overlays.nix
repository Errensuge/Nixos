{
  nixpkgs,
  nixpkgs-unstable,
  ...
}:
{
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    nixpkgs.lib.all (
      license:
      license.free
      || nixpkgs.lib.elem license.shortName [
        "CUDA EULA"
        "cuDNN EULA"
        "cuSPARSELt EULA"
        "cuTENSOR EULA"
        "NVidia OptiX EULA"
      ]
    ) (nixpkgs.lib.toList pkg.meta.license)
    || builtins.elem (nixpkgs.lib.getName pkg) [
      "nvidia-x11"
      "obsidian"
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
