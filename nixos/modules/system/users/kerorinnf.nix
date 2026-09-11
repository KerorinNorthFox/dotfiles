{
  pkgs,
  ...
}:

{
  programs.fish.enable = true;

  users.users."kerorinnf" = {
    isNormalUser = true;
    description = "kerorinnf";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGUZf+ifLseJwNLyys+N1/5v/NJF2278WH1aWDAMn6Yy masat@masato_desktop"
    ];
    packages = with pkgs; [ ];
    shell = pkgs.fish;
  };
}
