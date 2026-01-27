{ inputs, ... }:

{
  imports = [ ./users ];
  home-manager.useUserPackages = true;
  home-manager.overwriteBackup = true;
  home-manager.backupFileExtension = "bak";
  home-manager.extraSpecialArgs = { inherit inputs; };
}
