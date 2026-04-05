{
  lib,
  pkgs,
  config,
  ...
}:
with lib;
let
  grep = pkgs.gnugrep;
  cfg = config.os.flatpak.apps;
  flatpaks = [
    "com.usebottles.bottles"
    "io.github.flattool.Warehouse"
  ];
in
{
  options.os.flatpak.apps = {
    enable = mkEnableOption "System gnome apps service";
  };
  config = mkIf cfg.enable {

    services.flatpak.enable = true;
    system.userActivationScripts.flatpakManagement = {
      text = ''

        ${pkgs.flatpak}/bin/flatpak remote-add --if-not-exists fedora oci+https://registry.fedoraproject.org

        installedFlatpaks=$(${pkgs.flatpak}/bin/flatpak list --app --columns=application)

        for installed in $installedFlatpaks; do
          if ! echo ${toString flatpaks} | ${grep}/bin/grep -q $installed; then
            echo "Suppression de $installed car il n'est pas dans la liste desiredFlatpaks."
            ${pkgs.flatpak}/bin/flatpak uninstall -y --noninteractive $installed
          fi
        done

        for app in ${toString flatpaks}; do
          echo "Vérification que $app est installé."
          ${pkgs.flatpak}/bin/flatpak install -y flathub $app
        done

        ${pkgs.flatpak}/bin/flatpak uninstall --unused -y
        ${pkgs.flatpak}/bin/flatpak update -y

      '';
    };

  };
}
