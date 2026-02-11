{ import-tree, ... }:
{
  imports = [
    ./partials/users.nix
    (import-tree ./apps)
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";
}
