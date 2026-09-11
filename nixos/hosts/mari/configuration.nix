{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ../../modules/system/boot/grub.nix
    ../../modules/system/gc.nix
    ../../modules/system/users/kerorinnf.nix

    ../../modules/system/common

    ../../modules/system/display-manager/sddm
    ../../modules/system/window-manager/niri
  ];

  system.stateVersion = "26.05";
}
