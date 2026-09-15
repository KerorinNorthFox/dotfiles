{
  pkgs,
  ...
}:

{
  home.packages = [
    pkgs.vesktop
  ];
  xdg.configFile."vesktop/themes/midnight.theme.css".source = ./themes/midnight.theme.css;
}
