{
  pkgs,
  ...
}:

let
  sddm-astronaut = (
    pkgs.sddm-astronaut.override {
      embeddedTheme = "black_hole";
    }
  );
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
