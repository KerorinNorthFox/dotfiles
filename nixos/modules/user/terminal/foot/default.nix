{
  username ? "default",
}:

{
  programs.foot.enable = true;

  xdg.configFile."foot".source = ./config/${username};
}
