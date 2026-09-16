{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    kdePackages.dolphin
    kdePackages.qtsvg
    kdePackages.kde-cli-tools
    # テーマを、カラースキーマをdark系に設定したqt6ctに設定するよう
    # config.fishでQT_QPA_PLATFORMTHEME=qt6ctを設定.
    # BUG: home.sessionVariableでは環境変数を適用できなかった.
    # fishの設定をnixと別管理にしているため、設定をfishに統合できてないと考えられる.
    kdePackages.qt6ct
  ];
}
