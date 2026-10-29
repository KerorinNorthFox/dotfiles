{
  username ? "default",
}:
{
  programs.noctalia = {
    enable = true;
  };

  xdg.configFile."noctalia".source = ./config/${username};
}
