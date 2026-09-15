{
  programs.vesktop = {
    enable = true;
    vencord = {
      settings.enabledThemes = [ "./themes/midnight.theme.css" ];
    };
  };

  xdg.configFile."vesktop/themes/midnight.theme.css".source = ./themes/midnight.theme.css;
}
