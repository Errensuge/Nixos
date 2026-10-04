{ lib, config, ... }:
with lib;
let
  cfg = config.os.homebrew.microsoft.excel;
in
{
  options.os.homebrew.microsoft.excel = {
    enable = mkEnableOption "System microsoft homebrew service";
  };
  config = mkIf cfg.enable {

    homebrew.casks = [
      "microsoft-excel"
    ];

    system.defaults.dock.persistent-apps = [
      { app = "/Applications/Microsoft Excel.app"; }
    ];

  };
}
