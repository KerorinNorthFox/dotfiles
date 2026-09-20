{
  programs.nix-ld.enable = true; # Run unpatched dynamic binaries.
  programs.dconf.enable = true;
  programs.appimage.enable = true;

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  services.upower.enable = true;

  systemd.settings.Manager = {
    DefaultTimeoutStopSec = "10s";
  };
}
