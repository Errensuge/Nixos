{ ... }:
{
  system.primaryUser = "alistreaza";
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Homebrew apps
  os.homebrew.iterm.enable = true;
  os.homebrew.zed.enable = true;
  os.homebrew.jetbrain.enable = true;
  os.homebrew.iina.enable = true;
  os.homebrew.zen.enable = true;
  os.homebrew.obsidian.enable = true;
  os.homebrew.microsoft.enable = true;
  os.homebrew.keka.enable = true;
}
