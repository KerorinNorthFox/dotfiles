{
  config,
  inputs,
  pkgs,
  stateVersion,
  ...
}:

{
  imports = [
    ../../modules/user/browser/ani-cli.nix
    ../../modules/user/browser/vivaldi.nix
    ../../modules/user/buildtool/make.nix
    ../../modules/user/cli
    ../../modules/user/cursor/eku
    ../../modules/user/desktop-shell/notcalia
    ../../modules/user/editor/neovim
    ../../modules/user/editor/image/gimp.nix
    ../../modules/user/editor/image/krita.nix
    ../../modules/user/editor/video/losslesscut.nix
    ../../modules/user/file-manager/dolphin
    ../../modules/user/file-manager/yazi
    ../../modules/user/monitoring/bottom
    ../../modules/user/monitoring/btop
    ../../modules/user/notification/libnotify.nix
    ../../modules/user/shell/fish
    ../../modules/user/terminal/foot
    ../../modules/user/terminal/zellij
    ../../modules/user/viewer/image
    ../../modules/user/viewer/video

    inputs.noctalia.homeModules.default
  ];

  home = {
    username = "kerorinnf";
    homeDirectory = "/home/kerorinnf";

    file = {
      "avatar.png".source = ../../assets/kerorinnf/avatar.png;
    };

    inherit stateVersion;

    packages = with pkgs; [
      inputs.yt-x.packages."x86_64-linux".default
    ];
  };
}
