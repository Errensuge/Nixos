{ ... }:

{
  nix.settings.trusted-users = [
    # Needed by Devenv
    "root"
    "alistreaza"
  ];

  users.users = {
    alistreaza = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "podman"
      ];
    };
  };
}
