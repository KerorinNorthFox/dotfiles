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

    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [
        fcitx5-mozc
        fcitx5-gtk
      ];
      ignoreUserConfig = true;
      settings.inputMethod = {
        GroupOrder."0" = "Default";

        "Group/0" = {
          Name = "Default";
          "Default Layout" = "us";
          DefaultIM = "mozc";
        };
        "Group/0/Items/0".Name = "keyboard-us";
        "Group/0/Items/1".Name = "mozc";
      };
    };

  };
}
