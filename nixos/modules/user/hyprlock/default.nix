{
  username ? "default",
}:
{
  programs.hyprlock = {
    enable = true;
  };

  xdg.configFile."hypr/hyprlock.conf".source = ./config/${username}/hyprlock.conf;
}
