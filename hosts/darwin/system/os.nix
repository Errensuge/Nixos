{ ... }:
{
  system.primaryUser = "alistreaza";
  os.homebrew.enable = true;

  system.defaults.dock.persistent-apps = [
    { app = "/System/Applications/Apps.app"; }
    { app = "/System/Applications/Mail.app"; }
  ];

  # Homebrew System apps
  os.homebrew.keka.enable = true;
  os.homebrew.ghostty.enable = true;

  # Homebrew Net apps
  os.homebrew.zen.enable = true;

  # Homebrew Office apps
  os.homebrew.microsoft.word.enable = true;
  os.homebrew.microsoft.excel.enable = true;
  os.homebrew.microsoft.powerpoint.enable = true;
  os.homebrew.microsoft.team.enable = true;
  os.homebrew.obsidian.enable = true;
  os.homebrew.zotero.enable = true;

  # Homebrew IDE apps
  os.homebrew.zed.enable = true;
  os.homebrew.jetbrain.intellij.enable = true;
  os.homebrew.jetbrain.pycharm.enable = true;
  os.homebrew.jetbrain.phpstorm.enable = true;

  # Homebrew Media apps
  os.homebrew.iina.enable = true;

  nixpkgs.hostPlatform = "aarch64-darwin";
}
