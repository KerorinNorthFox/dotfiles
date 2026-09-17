{
  pkgs,
  ...
}:

{
  # gaming mouse configuration tool.
  environment.systemPackages = with pkgs; [
    piper
  ];

  services.ratbagd = {
    enable = true;
    package = pkgs.libratbag;
  };
}
