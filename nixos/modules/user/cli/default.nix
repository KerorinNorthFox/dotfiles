{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    # Alternative
    bat # colorized cat
    delta # colorized diff
    duf # df(view disk space) alternative
    dust # du(view disk usage) alfternative
    eza # colorized ls
    fd # fd alternative
    procs # colorized ps
    ripgrep # grep, alternative

    # Utilities
    fx # json viewer
    imagemagick
    typos # find typo in file
  ];
}
