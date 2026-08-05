{
  nixpkgs,
}:

{
  hostname,
  system ? "x86_64-linux",
  username ? hostname,
  description ? "",
  stateVersion ? "26.05",

  extraModules ? [ ],
  specialArgs ? { },
}:

let
  lib = nixpkgs.lib;
in

lib.nixosSystem {
  inherit system;

  specialArgs = specialArgs // {
    inherit hostname username description;
  };

  modules = [
    ../hosts/${hostname}/hardware-configuration.nix
    ../hosts/${hostname}/configuration.nix
  ]
  ++ extraModules;
}
