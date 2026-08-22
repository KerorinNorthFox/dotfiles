{
  pkgs,
  ...
}:

let
  sddm-astronaut =
    (pkgs.sddm-astronaut.override {
      embeddedTheme = "black_hole";
      themeConfig = {
        HeaderTextColor = "#b7c7d7";
        Background = "Backgrounds/sddm-wallpaper.jpg";
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
