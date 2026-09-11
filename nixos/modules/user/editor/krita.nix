{
  pkgs,
  ...
}:

let
  kritaWayland = pkgs.symlinkJoin {
    name = "krita-wayland";
    paths = [ pkgs.krita ];
    nativeBuildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/krita --set QT_QPA_PLATFORM wayland
    '';
  };
in
{
  home.packages = [
    kritaWayland
  ];
}
