{ inputs, ... }:

{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      alistreaza = import ../../home-manager/home.nix;
    };
  };
}
