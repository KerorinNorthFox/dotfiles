{
  config,
  pkgs,
  stateVersion,
  ...
}:

{
  imports = [
    ../../modules/shell/fish
    ../../modules/terminal/zellij
  ];

  home = {
    username = "kerorinnf";
    homeDirectory = "/home/kerorinnf";

    inherit stateVersion;

    packages = with pkgs; [
    ];
  };
}
