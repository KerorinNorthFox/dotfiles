{
  pkgs,
  ...
}:

{
  environment.systemPackages = [
    pkgs.lan-mouse
  ];
}
