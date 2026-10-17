{ pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages;
  boot.kernelModules = [
    "coretemp"
    "nct6775"
  ];
}
