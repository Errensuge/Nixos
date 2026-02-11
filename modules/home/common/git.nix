{
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.user.shell.git;
in
{
  options.user.shell.git = {
    enable = mkEnableOption "Zen Editor options";
  };
  config = mkIf cfg.enable {

    programs.git = {
      settings = {
        user = {
          name = "Laurent Gueret";
          email = "gueretlob@pm.me";
        };
      };
    };

  };
}
