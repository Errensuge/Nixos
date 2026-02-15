{ ... }:
{
  nix = {
    settings = {
      use-xdg-base-directories = true;
      experimental-features = "nix-command flakes";
      trusted-users = [
        # Needed by Devenv
        "root"
        "alistreaza"
      ];
    };
  };
}
