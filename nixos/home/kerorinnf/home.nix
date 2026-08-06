{
  config,
  pkgs,
  stateVersion,
  ...
}:

{
  imports = [
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
