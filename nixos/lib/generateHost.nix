{
  nixpkgs,
  home-manager,
  stateVersion,
}:

{
  hostname,
  system ? "x86_64-linux",
  username ? hostname,
  description ? "",

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

    home-manager.nixosModules.home-manager
    {
      networking.hostName = hostname;
      system.stateVersion = stateVersion;

      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;

        extraSpecialArgs = {
          inherit stateVersion;
        };
        users.${username} = import ../home/${username}/home.nix;
      };
    }
  ]
  ++ extraModules;
}
