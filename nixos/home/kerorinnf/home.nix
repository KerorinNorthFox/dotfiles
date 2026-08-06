{
  config,
  pkgs,
  stateVersion,
  ...
}:

{
  imports = [
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
