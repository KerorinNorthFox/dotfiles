{
  pkgs,
  ...
}:

{
  home.pacakges = with pkgs; [
    waybar
  ];
}
