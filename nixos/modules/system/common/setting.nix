{
  networking.networkmanager.enable = true;

  programs.nix-ld.enable = true; # Run unpatched dynamic binaries.
  programs.dconf.enable = true;

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
