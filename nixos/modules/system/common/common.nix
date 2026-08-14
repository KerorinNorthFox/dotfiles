{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    fastfetch
    git
    unar
    unrar
    unzip
    vim
    wget
    zip
  ];
}
