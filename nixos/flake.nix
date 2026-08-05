{
  description = "flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      lib = import ./lib {
        inherit nixpkgs;
      };
    in
    {
      nixosConfigurations = {
        rossi = lib.generateHost {
          hostname = "rossi";
          username = "kerorinnf";
          description = "Virtual Box configuration.";
        };
      };
    };
}
