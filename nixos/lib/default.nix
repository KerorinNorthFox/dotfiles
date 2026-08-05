{
  nixpkgs,
  home-manager,
  stateVersion,
}:

{
  generateHost = import ./generateHost.nix {
    inherit nixpkgs home-manager stateVersion;
  };
}
