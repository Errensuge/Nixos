{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.os.virtualisation.podman;
  all = builtins.attrNames config.users.users;
  users = builtins.filter (user: config.users.users.${user}.isNormalUser == true) all;
in
{
  options.os.virtualisation.podman = {
    enable = mkEnableOption "System docker service";
  };
  config = mkIf cfg.enable {

    virtualisation = {
      containers.enable = true;
      podman = {
        enable = true;
        dockerCompat = true;
        dockerSocket.enable = true;
        defaultNetwork.settings.dns_enabled = true; # Required for containers under podman-compose to be able to talk to each other.
      };
    };

    environment = {
      systemPackages = with pkgs; [
        podman-compose
      ];
    };

    users.groups.podman.members = users;

  };
}
