{
  username ? "default",
}:
{
  programs.bottom.enable = true;

  xdg.configFile."bottom".source = ./config/${username};
}
