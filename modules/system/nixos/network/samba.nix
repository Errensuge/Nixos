{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.os.networks.samba;
in
{
  options.os.networks.samba = {
    enable = mkEnableOption "System pipewire service";
  };
  config = mkIf cfg.enable {

    services.samba = {
      enable = true;
      openFirewall = true;
      usershares.enable = true;
      package = pkgs.samba4Full;
    };

    services.samba-wsdd = {
      enable = true;
      openFirewall = true;
    };

  };
}
