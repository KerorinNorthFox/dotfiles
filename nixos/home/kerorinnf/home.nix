{
  config,
  pkgs,
  inputs,
  system,
  stateVersion,
  ...
}:

let
  username = "kerorinnf";
in
{
  imports = [
    ../../modules/user/ani-cli
    ../../modules/user/buildtool/make.nix
    ../../modules/user/cli
    ../../modules/user/cli/lazygit
    ../../modules/user/cursor/eku
    ../../modules/user/discord.nix
    ../../modules/user/editor/gimp.nix
    ../../modules/user/editor/kid3.nix
    ../../modules/user/editor/krita.nix
    ../../modules/user/editor/losslesscut.nix
    ../../modules/user/editor/neovim
    ../../modules/user/file-manager/dolphin
    (import ../../modules/user/file-manager/yazi { })
    ../../modules/user/hyprlock.nix
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
    inherit username;
    homeDirectory = "/home/${username}";

    file = {
      "avatar.png".source = ../../assets/${username}/avatar.png;
    };

    inherit stateVersion;

    packages = with pkgs; [
      inputs.yt-x.packages.${system}.default
    ];
  };
}
