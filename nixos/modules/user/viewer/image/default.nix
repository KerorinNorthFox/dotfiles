{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    kdePackages.okular
    nomacs
    qimgv
    feh
    shotwell
    xnviewmp
    digikam
  ];
}
