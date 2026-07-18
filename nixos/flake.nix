{
  description = "flake default configuration";

  inputs = {
    nixos-wsl.url = "github:nix-community/NixOS-WSL/release-26.05";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
  };

  outputs = { self, nixpkgs, nixos-wsl, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
	nixos-wsl.nixosModules.default
	{
	  system.stateVersion = "26.05";
	  wsl.enable = true;
	}
      ];
    };
  };
}
