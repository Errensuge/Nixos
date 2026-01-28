{ lib, config, ... }:
with lib;
let
  cfg = config.os.shell.git;
in
{
  options.os.shell.git = {
    enable = mkEnableOption "System git service";
  };
  config = mkIf cfg.enable {

    programs.git = {
      enable = true;
      config = {
        init.defaultBranch = "main";
        user = {
          name = "Laurent Gueret";
          email = "gueretlob@icloud.com";
        };
      };
    };

    programs.ssh.enableAskPassword = false;

  };
}
