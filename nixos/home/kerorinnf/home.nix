{
  config,
  pkgs,
  stateVersion,
  ...
}:

{
  imports = [
    ../../modules/user/buildtool/make.nix
    ../../modules/user/editor/neovim
    ../../modules/user/shell/fish
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
