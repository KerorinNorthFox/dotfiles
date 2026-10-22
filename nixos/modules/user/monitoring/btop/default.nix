{
  username ? "default",
}:
{
  programs.btop.enable = true;

  xdg.configFile."btop".source = ./config/${username};
}
