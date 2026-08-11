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
    ../../modules/user/cli/bat
    ../../modules/user/cli/delta
    ../../modules/user/cli/eza
    ../../modules/user/cli/fd
    ../../modules/user/cli/ripgrep
    ../../modules/user/editor/neovim
    ../../modules/user/file-manager/dolphin
    ../../modules/user/file-manager/yazi
    ../../modules/user/monitoring/bottom
    ../../modules/user/monitoring/btop
    ../../modules/user/shell/fish
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
