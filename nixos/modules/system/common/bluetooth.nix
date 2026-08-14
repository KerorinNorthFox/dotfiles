{
  pkgs,
  ...
}:

{
  hardware.bluetooth = {
    enable = true;
    package = pkgs.bluez;
    powerOnBoot = true;

    settings.General = {
      Experimental = true;
      FastConnectable = true;
    };
    settings.Policy.AutoEnable = true;
  };

  services.blueman.enable = true;
}
