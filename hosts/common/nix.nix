{ ... }:
{
  system.primaryUser = "alistreaza";

  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      trusted-users = [
        # Needed by Devenv
        "root"
        "alistreaza"
      ];
    };
  };
}
