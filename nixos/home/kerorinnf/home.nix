{
  config,
  inputs,
  pkgs,
  stateVersion,
  ...
}:

{
  imports = [
    ../../modules/user/browser/vivaldi
    ../../modules/user/buildtool/make.nix
    ../../modules/user/cli
    inputs.noctalia.homeModules.default
    ../../modules/user/desktop-shell/notcalia
    ../../modules/user/editor/neovim
    ../../modules/user/editor/video/losslesscut
    ../../modules/user/file-manager/dolphin
    ../../modules/user/file-manager/yazi
    ../../modules/user/monitoring/bottom
    ../../modules/user/monitoring/btop
    ../../modules/user/notification/libnotify
    ../../modules/user/shell/fish
    ../../modules/user/terminal/foot
    ../../modules/user/terminal/zellij
    ../../modules/user/viewer/image
    ../../modules/user/viewer/video
  ];

  home = {
    username = "kerorinnf";
    homeDirectory = "/home/kerorinnf";

    file = {
      "avatar.png".source = ../../assets/kerorinnf/avatar.png;
    };

    inherit stateVersion;

    packages = with pkgs; [
    ];
  };
}
