{
  config,
  lib,
  pkgs,
  modulesPath,
  inputs,
  ...
}:

{
  imports = [
    inputs.nixos-hardware.nixosModules.common-cpu-intel
    inputs.nixos-hardware.nixosModules.common-pc-laptop
    inputs.nixos-hardware.nixosModules.common-pc-laptop-ssd
  ];
  # TODO: nixosインストール後のhardware-configuration.nixを追記.
}
