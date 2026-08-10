{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    kdePackages.fcitx5-configtool
  ];

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.waylandFrontend = true;
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-gtk
    ];
  };
}
