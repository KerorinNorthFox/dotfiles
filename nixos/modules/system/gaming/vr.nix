{
  pkgs,
  inputs,
  system,
  ...
}:

{
  services.wivrn = {
    enable = true;
    openFirewall = true;
    autoStart = true;
    package = inputs.wivrn.packages.${system}.default.override {
      cudaSupport = true;
    };
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  environment.systemPackages = with pkgs; [
    wivrn
    wayvr
    xrizer
  ];
}
