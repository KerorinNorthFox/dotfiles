{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    osu-lazer
  ];
}
