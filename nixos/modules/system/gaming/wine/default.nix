{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    wineWow64Packages.stable
    wineWow64Packages.waylandFull
    winetricks
  ];
}
