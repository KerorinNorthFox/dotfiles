{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    binutils
    gcc
    gnumake
    pkg-config
  ];
}
