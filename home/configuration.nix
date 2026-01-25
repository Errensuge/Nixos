{ inputs, ... }:

{
  imports = [ ./parts/users.nix ];
  home-manager.useUserPackages = true;
  home-manager.overwriteBackup = true;
  home-manager.backupFileExtension = "bak";
  home-manager.extraSpecialArgs = { inherit inputs; };
}
