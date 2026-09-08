{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ../../modules/system/common/

    ../../modules/system/display-manager/sddm
    ../../modules/system/window-manager/niri
  ];

  boot.loader = {
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = true;
    };
    efi.canTouchEfiVariables = true;
  };

  programs.fish.enable = true;

  users.users."kerorinnf" = {
    isNormalUser = true;
    description = "kerorinnf";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [ ];
    shell = pkgs.fish;
  };

  nix.settings.auto-optimise-store = true;

  system.stateVersion = "26.05";
}
