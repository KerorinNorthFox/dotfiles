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

    ../../modules/system/common

    ../../modules/system/buildtool/make.nix
    (import ../../modules/system/display-manager/sddm { original_theme = "rossi_namie"; })
    ../../modules/system/editor/blender.nix
    ../../modules/system/gaming/bottles.nix
    ../../modules/system/gaming/dosbox.nix
    ../../modules/system/gaming/faugus.nix
    ../../modules/system/gaming/lutris.nix
    ../../modules/system/gaming/osu-lazer.nix
    ../../modules/system/gaming/steam.nix
    ../../modules/system/gaming/tools.nix
    ../../modules/system/gaming/vr.nix
    ../../modules/system/gaming/wine.nix
    ../../modules/system/streaming/localsend.nix
    ../../modules/system/streaming/sunshine.nix
    ../../modules/system/tools/disk.nix
    ../../modules/system/tools/ffmpeg.nix
    ../../modules/system/tools/lan-mouse.nix
    ../../modules/system/tools/logitech.nix
    ../../modules/system/tools/nvtop.nix
    ../../modules/system/tools/opentabletdriver.nix
    ../../modules/system/tools/piper.nix
    ../../modules/system/tools/qpwgraph.nix
    ../../modules/system/window-manager/niri
  ];

  system.stateVersion = "26.05";
}
