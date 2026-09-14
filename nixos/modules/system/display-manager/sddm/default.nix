{
  original_theme ? "suzuran_snow",
}:
{
  pkgs,
  ...
}:

let
  sddm-astronaut = import ./config/${original_theme}/setting.nix { inherit pkgs; };
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
