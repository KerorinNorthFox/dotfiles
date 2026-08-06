{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [ fish ];

  # TODO: 全ての設定完了後にシンボリックリンクを解除して設定ファイルのパスを設定.
  # xdg.configFile."fish".source = ../../../../../default/.config/fish/config.fish;
}
