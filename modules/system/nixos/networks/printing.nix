{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.os.networks.printing;
  all = builtins.attrNames config.users.users;
  users = builtins.filter (user: config.users.users.${user}.isNormalUser == true) all;
in
{
  options.os.networks.printing = {
    enable = mkEnableOption "System printing service";
  };
  config = mkIf cfg.enable {

    services.printing = {
      enable = true;
      startWhenNeeded = true;
      drivers = with pkgs; [ hplip ];
    };

    hardware.sane = {
      enable = true;
      extraBackends = with pkgs; [ sane-airscan ];
    };

    users.groups.lp.members = users;
    users.groups.scanner.members = users;

  };
}
