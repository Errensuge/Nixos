{ ... }:

{
  users.users = {
    alistreaza = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };
  };
}
