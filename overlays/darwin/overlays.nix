{ pkgs, ... }:
let
  package = pkgs.rustPlatform.buildRustPackage {
    pname = "paneru";
    version = "0.3.0";
    src = pkgs.fetchFromGitHub {
      owner = "karinushka";
      repo = "paneru";
      rev = "66c94493cc99ee7715b4beb1e5cf455ada60213a";
      sha256 = "sha256-VyKzfnXfnIkyjbg1RQTDaIbMdPQjNBD5dxVL6OZQf2U=";
    };
    cargoHash = "sha256-nVOhtPbX7pN5K/xqv0Nlx7MZDg9ASTxfgdTy/Kagui8=";
    postPatch = ''
      substituteInPlace build.rs --replace-fail \
        'let sdk_dir = "/Library/Developer/CommandLineTools/SDKs";' \
        'let sdk_dir = "${pkgs.apple-sdk}/Platforms/MacOSX.platform/Developer/SDKs";'
    '';
    buildInputs = [ pkgs.apple-sdk.privateFrameworksHook ];
    doCheck = false;
    meta = {
      platforms = [ "aarch64-darwin" ];
    };
  };
in
{
  nixpkgs.overlays = [
    (final: prev: {
      paneru = package;
    })
  ];
}
