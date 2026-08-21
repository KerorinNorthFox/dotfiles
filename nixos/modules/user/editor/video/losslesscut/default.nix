{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    losslesscut
  ];
}
