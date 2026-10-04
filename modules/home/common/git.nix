{
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.home.shell.git;
in
{
  options.home.shell.git = {
    enable = mkEnableOption "Git options";
  };
  config = mkIf cfg.enable {

    programs.git = {
      enable = true;
      settings = {
        user = {
          name = "Laurent Gueret";
          email = "gueretlob@pm.me";
        };
      };
    };

  };
}
