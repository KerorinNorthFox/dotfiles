{
  description = "flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    yt-x = {
      url = "github:Benexl/yt-x";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-stable,
      ...
    }@inputs:
    let
      stateVersion = "26.05";
      lib = import ./lib { inherit inputs; };
    in
    {
      nixosConfigurations = {
        # Desktop host.
        hibiki = lib.generateHost {
          inherit stateVersion;
          hostname = "hibiki";
          usernames = [ "kerorinnf" ];
          description = "Desktop configuration.";
        };
        # Laptop host.
        mari = lib.generateHost {
          inherit stateVersion;
          hostname = "mari";
          usernames = [ "kerorinnf" ];
          description = "Laptop configuration.";
        };
        # Virtual Box host.
        rossi = lib.generateHost {
          inherit stateVersion;
          hostname = "rossi";
          usernames = [ "kerorinnf" ];
          description = "Virtual Box configuration.";
        };
      };
    };
}
