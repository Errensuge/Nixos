{ paneru, ... }:
{

  nixpkgs.overlays = [
    (final: prev: {
      paneru = paneru.overrideAttrs (old: {
        package.doCheck = false;
      });
    })
  ];
}
