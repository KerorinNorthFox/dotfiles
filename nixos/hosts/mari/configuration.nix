{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ../../modules/system/boot/grub.nix
    ../../modules/system/users/kerorinnf.nix
    ../../modules/system/gc.nix
    ../../modules/system/laptop.nix

    ../../modules/system/common

    (import ../../modules/system/display-manager/sddm { original_theme = "suzuran_snow"; })
    ../../modules/system/gaming/dosbox.nix
    ../../modules/system/gaming/wine.nix
    ../../modules/system/window-manager/niri
  ];

  system.stateVersion = "26.05";
}
