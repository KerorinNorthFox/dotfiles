{
  username ? "default",
}:
{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    yazi
  ];

  xdg.configFile."yazi".source = ./config/${username};
}
