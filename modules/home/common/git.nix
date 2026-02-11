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
    enable = mkEnableOption "Zen Editor options";
  };
  config = mkIf cfg.enable {

    programs.git = {
      enable = true;
      config.init.defaultBranch = "main";
      settings = {
        user = {
          name = "Laurent Gueret";
          email = "gueretlob@pm.me";
        };
      };
    };

  };
}
