{
  config,
  pkgs,
  inputs,
  system,
  stateVersion,
  ...
}:

{
  imports = [
    ../../modules/user/ani-cli
    ../../modules/user/buildtool/make.nix
    ../../modules/user/cli
    ../../modules/user/cursor/eku
    ../../modules/user/discord.nix
    ../../modules/user/editor/gimp.nix
    ../../modules/user/editor/kid3.nix
    ../../modules/user/editor/krita.nix
    ../../modules/user/editor/losslesscut.nix
    ../../modules/user/editor/neovim
    ../../modules/user/file-manager/dolphin
    ../../modules/user/file-manager/yazi
    ../../modules/user/monitoring/bottom
    ../../modules/user/monitoring/btop
    ../../modules/user/noctalia
    ../../modules/user/notification/libnotify.nix
    ../../modules/user/obs-studio
    ../../modules/user/qpwgraph.nix
    ../../modules/user/shell/fish
    ../../modules/user/terminal/foot
    ../../modules/user/terminal/zellij
    ../../modules/user/viewer/image
    ../../modules/user/viewer/music
    ../../modules/user/viewer/video
    ../../modules/user/vivaldi
  ];

  home = {
    username = "kerorinnf";
    homeDirectory = "/home/kerorinnf";

    file = {
      "avatar.png".source = ../../assets/kerorinnf/avatar.png;
    };

    inherit stateVersion;

    packages = with pkgs; [
      inputs.yt-x.packages.${system}.default
    ];
  };
}
