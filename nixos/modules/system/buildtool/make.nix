{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    binutils
    gcc
    gnumake
    pkg-config
  ];
}
