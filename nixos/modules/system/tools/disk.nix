{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    gparted
    gnome-disk-utility
  ];
}
