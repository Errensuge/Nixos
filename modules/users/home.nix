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

      # Apps shell
      programs.git = {
        settings = {
          user = {
            name = "Laurent Gueret";
            email = "gueretlob@pm.me";
          };
        };
      };

      # Code editor
      os.ide.zed.enable = true;

      # IDE Jetbrains
      os.ide.jetbrains.idea.enable = false;
      os.ide.jetbrains.pycharm.enable = false;
      os.ide.jetbrains.phpstorm.enable = false;
      os.ide.jetbrains.rustrover.enable = false;

      # IDE Data Jetbrains
      os.ide.jetbrains.datagrip.enable = false;
      os.ide.jetbrains.dataspell.enable = false;

      # Markdown Editor
      os.editor.obsidian.enable = false;

      home.stateVersion = "25.11";
    };
  };
}
