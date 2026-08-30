{
  inputs,
  stateVersion,
  hostname,
  system ? "x86_64-linux",
  usernames ? [ hostname ],
  description ? "",

  extraModules ? [ ],
  specialArgs ? { },
}:

let
  lib = inputs.nixpkgs.lib;
in

lib.nixosSystem {
  inherit system;

  specialArgs = specialArgs // {
    inherit hostname usernames description;
  };

  modules = [
    ../hosts/${hostname}/hardware-configuration.nix
    ../hosts/${hostname}/configuration.nix

    inputs.home-manager.nixosModules.home-manager
    {
      networking.hostName = hostname;
      system.stateVersion = stateVersion;

      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;

        extraSpecialArgs = {
          inherit inputs stateVersion;
        };
        users = builtins.listToAttrs (
          map (user: {
            name = user;
            value = import ../home/${user}/home.nix;
          }) usernames
        );
      };
    }
  ]
  ++ extraModules;
}
