{
  pkgs,
  ...
}:

{
  environment.systemPackages = [
    pkgs.dosbox
  ];
}
