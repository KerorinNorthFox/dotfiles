{
  config,
  pkgs,
  stateVersion,
  ...
}:

{
  imports = [
    ../../modules/user/browser/vivaldi
    ../../modules/user/buildtool/make.nix
    ../../modules/user/cli
    ../../modules/user/editor/neovim
    ../../modules/user/file-manager/dolphin
    ../../modules/user/file-manager/yazi
    ../../modules/user/monitoring/bottom
    ../../modules/user/monitoring/btop
    ../../modules/user/notification/libnotify
    ../../modules/user/notification/swaync
    ../../modules/user/search/rofi
    ../../modules/user/shell/fish
    ../../modules/user/status-bar/waybar
    ../../modules/user/terminal/foot
    ../../modules/user/terminal/zellij
  ];

  home = {
    username = "kerorinnf";
    homeDirectory = "/home/kerorinnf";

    inherit stateVersion;

    packages = with pkgs; [
    ];
  };
}
