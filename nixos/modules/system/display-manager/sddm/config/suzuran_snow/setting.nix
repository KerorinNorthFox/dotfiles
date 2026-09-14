{
  pkgs,
}:

(pkgs.sddm-astronaut.override {
  embeddedTheme = "black_hole";
  themeConfig = {
    Font = "FiraMono Nerd Font Mono";

    Background = "Backgrounds/sddm-wallpaper.jpg";
    CropBackground = "true";
    BackgroundHorizontalAlignment = "center";
    BackgroundVerticalAlignment = "center";

    HeaderTextColor = "#cdc9d3";
    DateTextColor = "#cdc9d3";
    TimeTextColor = "#cdc9d3";

    FormBackgroundColor = "#242455";
    BackgroundColor = "#242455";
    DimBackgroundColor = "#242455";

    LoginFieldBackgroundColor = "#111111";
    PasswordFieldBackgroundColor = "#111111";
    LoginFieldTextColor = "#cdc9d3";
    PasswordFieldTextColor = "#cdc9d3";
    UserIconColor = "#cdc9d3";
    PasswordIconColor = "#cdc9d3";

    PlaceholderTextColor = "#bbbbbb";
    WarningColor = "#cdc9d3";

    LoginButtonTextColor = "#000055";
    LoginButtonBackgroundColor = "#cdc9d3";
    SystemButtonsIconsColor = "#cdc9d3";
    SessionButtonTextColor = "#cdc9d3";
    VirtualKeyboardButtonTextColor = "#cdc9d3";

    DropdownTextColor = "#000055";
    DropdownSelectedBackgroundColor = "#cdc9d3";
    DropdownBackgroundColor = "#90b4ff";

    HighlightTextColor = "#000055";
    HighlightBackgroundColor = "#cdc9d3";
    HighlightBorderColor = "transparent";

    HoverUserIconColor = "#fcfcff";
    HoverPasswordIconColor = "#fcfcff";
    HoverSystemButtonsIconsColor = "#fcfcff";
    HoverSessionButtonTextColor = "#fcfcff";
    HoverVirtualKeyboardButtonTextColor = "#fcfcff";

    PartialBlur = "true";
    BlurMax = "24";
    Blur = "2.0";

    HaveFormBackground = "true";
    FormPosition = "left";
  };
}).overrideAttrs
  (oldAttrs: {
    installPhase = oldAttrs.installPhase + ''
      chmod u+w $out/share/sddm/themes/sddm-astronaut-theme/Backgrounds/
      cp ${./sddm-wallpaper.jpg} $out/share/sddm/themes/sddm-astronaut-theme/Backgrounds/sddm-wallpaper.jpg
    '';
  })
