{
  pkgs,
  ...
}:

let
  sddm-astronaut =
    (pkgs.sddm-astronaut.override {
      embeddedTheme = "black_hole";
      themeConfig = {
        Font = "FiraMono Nerd Font Mono";

        Background = "Backgrounds/sddm-wallpaper.jpg";

        HeaderTextColor = "#93a7be";
        DateTextColor = "#93a7be";
        TimeTextColor = "#697f98";

        FormBackgroundColor = "#d7ebf2";

        LoginFieldBackgroundColor = "#fafeff";
        PasswordFieldBackgroundColor = "#fafeff";
        LoginFieldTextColor = "#697f98";
        PasswordFieldTextColor = "#697f98";
        UserIconColor = "#697f98";
        PasswordIconColor = "#697f98";

        PlaceholderTextColor = "#adc0d3";
        WarningColor = "#eb8a8a";

        LoginButtonTextColor = "#fafeff";
        LoginButtonBackgroundColor = "#a1c9e8";
        SystemButtonsIconsColor = "#697f98";
        SessionButtonTextColor = "#697f98";
        VirtualKeyboardButtonTextColor = "#697f98";

        DropdownTextColor = "#fafeff";
        DropdownSelectedBackgroundColor = "#a1c9e8";
        DropdownBackgroundColor = "#b0d8f2";

        HighlightTextColor = "#fbe4e8";
        HighlightBackgroundColor = "#697f98";
        HighlightBorderColor = "#fbe4e8";

        HoverUserIconColor = "#fbe4e8";
        HoverPasswordIconColor = "#fbe4e8";
        HoverSystemButtonsIconsColor = "#fbe4e8";
        HoverSessionButtonTextColor = "#fbe4e8";
        HoverVirtualKeyboardButtonTextColor = "#fbe4e8";
      };
    }).overrideAttrs
      (oldAttrs: {
        installPhase = oldAttrs.installPhase + ''
          chmod u+w $out/share/sddm/themes/sddm-astronaut-theme/Backgrounds/
          cp ${./sddm-wallpaper.jpg} $out/share/sddm/themes/sddm-astronaut-theme/Backgrounds/sddm-wallpaper.jpg
        '';
      });
in
{
  environment.systemPackages = [ sddm-astronaut ];

  services.displayManager = {
    sddm = {
      enable = true;
      package = pkgs.kdePackages.sddm;
      extraPackages = with pkgs; [
        kdePackages.qtmultimedia
      ];
      theme = "sddm-astronaut-theme";
      wayland.enable = true;
    };
  };
}
