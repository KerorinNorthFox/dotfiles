{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [ neovim ];
  # TODO: 全ての設定完了後にシンボリックリンクを解除して設定ファイルのパスを設定.
  # programs.neovim.enable = true;
  # xdg.configFile."neovim".source = ../../../../../default/.config/nvim/init.lua;
}
