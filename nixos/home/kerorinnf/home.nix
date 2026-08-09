{
  config,
  pkgs,
  stateVersion,
  ...
}:

{
  imports = [
    ../../modules/user/buildtool/make.nix
    ../../modules/user/cli/bat
    ../../modules/user/cli/delta
    ../../modules/user/cli/eza
    ../../modules/user/cli/fd
    ../../modules/user/cli/ripgrep
    ../../modules/user/editor/neovim
    ../../modules/user/monitoring/bottom
    ../../modules/user/monitoring/btop
    ../../modules/user/shell/fish
    ../../modules/user/terminal/foot/
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
