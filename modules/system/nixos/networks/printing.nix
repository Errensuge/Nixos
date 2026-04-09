{
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.os.networks.printing;
in
{
  options.os.networks.printing = {
    enable = mkEnableOption "System printing service";
  };
  config = mkIf cfg.enable {

    services.printing = {
      enable = true;
    };

  };
}
