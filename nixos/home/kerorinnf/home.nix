{
  config,
  pkgs,
  stateVersion,
  ...
}:

{
  home = {
    username = "kerorinnf";
    homeDirectory = "/home/kerorinnf";

    inherit stateVersion;

    packages = with pkgs; [
    ];
  };
}
