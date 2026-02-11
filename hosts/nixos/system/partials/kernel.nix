{ pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelModules = [
    "coretemp"
    "nct6775"
  ];
}
