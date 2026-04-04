{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.os.graphics.nvidia.systemd;
in
{
  options.os.graphics.nvidia.systemd = {
    enable = mkEnableOption "System nvidia service";
  };
  config = mkIf cfg.enable {

    systemd = {
      services.systemd-suspend.environment.SYSTEMD_SLEEP_FREEZE_USER_SESSIONS = "false"; # Uncertain if this is still required or not.
      services."gnome-suspend" = {
        description = "suspend gnome shell";
        before = [
          "systemd-suspend.service"
          "systemd-hibernate.service"
          "nvidia-suspend.service"
          "nvidia-hibernate.service"
        ];
        wantedBy = [
          "systemd-suspend.service"
          "systemd-hibernate.service"
        ];
        serviceConfig = {
          Type = "oneshot";
          ExecStart = "${pkgs.procps}/bin/pkill -f -STOP ${pkgs.gnome-shell}/bin/gnome-shell";
        };
      };
      services."gnome-resume" = {
        description = "resume gnome shell";
        after = [
          "systemd-suspend.service"
          "systemd-hibernate.service"
          "nvidia-resume.service"
        ];
        wantedBy = [
          "systemd-suspend.service"
          "systemd-hibernate.service"
        ];
        serviceConfig = {
          Type = "oneshot";
          ExecStart = "${pkgs.procps}/bin/pkill -f -CONT ${pkgs.gnome-shell}/bin/gnome-shell";
        };
      };
    };

  };
}
