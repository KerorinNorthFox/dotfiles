{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    kdePackages.okular
    nomacs
    qview
    qimgv
    feh
    sxiv
    shotwell
    xnviewmp
    digikam
  ];
}
