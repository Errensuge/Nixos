{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.os.shell.dev;
in
{
  options.os.shell.dev = {
    enable = mkEnableOption "System git service";
  };
  config = mkIf cfg.enable {

    environment.systemPackages = with pkgs; [
      llvm
    ];

  };
}
