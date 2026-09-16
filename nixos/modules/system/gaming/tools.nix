{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    mangohud # system monitoring
  ];

  programs.gamemode.enable = true; # optimize system performance on demand.
}
