{
  lib,
  config,
  homebrew-core,
  homebrew-cask,
  ...
}:
let
  cfg = config.os.homebrew;
in
{
  options.os.homebrew = {
    enable = lib.mkEnableOption "Homebrew options";
  };
  config = lib.mkIf cfg.enable {

    nix-homebrew = {
      # User owning the Homebrew prefix
      user = "alistreaza";

      # Install Homebrew under the default prefix
      enable = true;
      autoMigrate = true;

      # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
      enableRosetta = false;

      # Optional: Declarative tap management
      taps = {
        "homebrew/homebrew-core" = homebrew-core;
        "homebrew/homebrew-cask" = homebrew-cask;
      };

      # Optional: Enable fully-declarative tap management
      #
      # With mutableTaps disabled, taps can no longer be added imperatively with `brew tap`.
      mutableTaps = false;
    };

    homebrew.enable = true;
    homebrew.taps = builtins.attrNames config.nix-homebrew.taps;

  };
}
