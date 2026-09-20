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
    ../../modules/user/cli/lazygit
    ../../modules/user/cli/navi
    ../../modules/user/cli/tealdeer
    ../../modules/user/cli/ani-cli.nix
    ../../modules/user/cli
    ../../modules/user/cli/nix-tools.nix
    ../../modules/user/cursor/eku
    ../../modules/user/editor/neovim
    ../../modules/user/editor/audacity.nix
    ../../modules/user/editor/freecad.nix
    ../../modules/user/editor/gimp.nix
    ../../modules/user/editor/handbrake.nix
    ../../modules/user/editor/kid3.nix
    ../../modules/user/editor/krita.nix
    ../../modules/user/editor/libreoffice.nix
    ../../modules/user/editor/losslesscut.nix
    ../../modules/user/file-manager/dolphin
    (import ../../modules/user/file-manager/yazi { })
    ../../modules/user/monitoring/bottom
    ../../modules/user/monitoring/btop
    ../../modules/user/noctalia
    ../../modules/user/notification/swaync
    ../../modules/user/notification/libnotify.nix
    ../../modules/user/obs-studio
    ../../modules/user/search/fsearch.nix
    ../../modules/user/shell/fish
    ../../modules/user/sns/vesktop
    ../../modules/user/sns/discord.nix
    ../../modules/user/terminal/foot
    ../../modules/user/terminal/zellij
    ../../modules/user/viewer/image
    ../../modules/user/viewer/music
    ../../modules/user/viewer/video
    ../../modules/user/vivaldi
    ../../modules/user/hyprlock.nix
    ../../modules/user/hyprpicker.nix
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
