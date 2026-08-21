{
  pkgs,
  ...
}:

{
  console.keyMap = "jp106";

  services.xserver.xkb = {
    layout = "jp";
    model = "jp106";
    variant = "";
  };

  environment.systemPackages = with pkgs; [
    evtest
  ];
}
