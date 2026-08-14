{
  description = "flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      stateVersion = "26.05";
      lib = import ./lib {
        inherit
          nixpkgs
          inputs
          home-manager
          stateVersion
          ;
      };
    in
    {
      nixosConfigurations = {
        rossi = lib.generateHost {
          hostname = "rossi";
          usernames = [ "kerorinnf" ];
          description = "Virtual Box configuration.";
        };
      };
    };
}
