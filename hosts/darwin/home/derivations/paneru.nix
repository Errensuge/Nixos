let
  pkgs = import <nixpkgs> { };
in
pkgs.paneru.overrideAttrs (old: {
  old.package.doCheck = false;
})
