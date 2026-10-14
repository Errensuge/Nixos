{ lib, config, ... }:
with lib;
let
  cfg = config.os.homebrew.zotero;
in
{
  options.os.homebrew.zotero = {
    enable = mkEnableOption "System zotero homebrew service";
  };
  config = mkIf cfg.enable {

    homebrew.casks = [
      "zotero"
    ];

  };
}
