{
  lib,
  pkgs,
  config,
  ...
}:
with lib;
let
  cfg = config.user.ide.jetbrains.rubymine;
in
{
  options.user.ide.jetbrains.rubymine = {
    enable = mkEnableOption "JetBrains options";
  };
  config = mkIf cfg.enable {

    home.packages = with pkgs.unstable; [
      jetbrains.ruby-mine
    ];

  };
}
