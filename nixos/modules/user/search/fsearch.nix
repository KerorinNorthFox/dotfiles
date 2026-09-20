{
  pkgs,
  ...
}:

let
  fsearchDark = pkgs.writeShellScriptBin "fsearch-dark" ''
    export XDG_CONFIG_HOME="$HOME/.config/fsearch-dark"
    export XDG_DATA_HOME="$HOME/.local/share/fsearch-dark"
    exec ${pkgs.fsearch}/bin/fsearch "$@"
  '';
in
{
  home.packages = [
    pkgs.fsearch
    fsearchDark
  ];
}
