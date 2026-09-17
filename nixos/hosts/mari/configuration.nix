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

    ../../modules/system/buildtool/make.nix
    (import ../../modules/system/display-manager/sddm { original_theme = "suzuran_snow"; })
    ../../modules/system/gaming/bottles.nix
    ../../modules/system/gaming/dosbox.nix
    ../../modules/system/gaming/wine.nix
    ../../modules/system/tools/ffmpeg.nix
    ../../modules/system/tools/lan-mouse.nix
    ../../modules/system/tools/piper.nix
    ../../modules/system/tools/qpwgraph.nix
    ../../modules/system/window-manager/niri
  ];

  system.stateVersion = "26.05";
}
