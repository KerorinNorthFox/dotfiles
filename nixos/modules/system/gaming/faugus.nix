{
  pkgs,
  ...
}:

{
  # シンプルで軽量なゲームランチャー.
  # メインのゲームランチャーとして使用を想定.
  environment.systemPackages = with pkgs; [
    faugus-launcher
  ];
}
