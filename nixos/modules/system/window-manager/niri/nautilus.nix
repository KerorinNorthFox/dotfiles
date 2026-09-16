{
  pkgs,
  ...
}:

{
  programs.niri.useNautilus = true;

  services.gvfs.enable = true;
  services.udisks2.enable = true;
}
