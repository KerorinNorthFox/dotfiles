{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    nix-melt # flake.lock viewer
    nix-tree # browse nix store dependencies
  ];
}
