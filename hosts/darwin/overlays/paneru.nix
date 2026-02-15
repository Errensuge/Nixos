{ ... }:
{
  nixpkgs.overlays = [
    (final: prev: {
      paneru = prev.callPackage ../packages/paneru.nix { };
    })
  ];
}
