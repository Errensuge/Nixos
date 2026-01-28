{ import-tree, ... }:
{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.overwriteBackup = true;
  home-manager.backupFileExtension = "bak";

  home-manager.users = {
    alistreaza = {

      imports = [
        (import-tree ./options)
        (import-tree ./partials)
      ];

      home = {
        username = "alistreaza";
        homeDirectory = "/home/alistreaza";
      };

      os.ide.zed.enable = true;
      os.ide.jetbrains.enable = true;

      home.stateVersion = "25.11";
    };
  };
}
