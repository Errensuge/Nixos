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

      programs.git = {
        extraConfig = {
          user = {
            name = "Laurent Gueret";
            email = "gueretlob@pm.me";
          };
        };
      };

      # Code editor
      os.ide.zed.enable = true;

      # IDE Jetbrains
      os.ide.jetbrains.idea.enable = true;
      os.ide.jetbrains.pycharm.enable = true;
      os.ide.jetbrains.phpstorm.enable = true;
      os.ide.jetbrains.rustrover.enable = true;

      # IDE Data Jetbrains
      os.ide.jetbrains.datagrip.enable = true;
      os.ide.jetbrains.dataspell.enable = true;

      # Markdown Editor
      os.editor.obsidian.enable = true;

      home.stateVersion = "25.11";
    };
  };
}
