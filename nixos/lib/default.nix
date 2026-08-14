{
  nixpkgs,
  inputs,
  home-manager,
  stateVersion,
}:

{
  generateHost = import ./generateHost.nix {
    inherit
      nixpkgs
      inputs
      home-manager
      stateVersion
      ;
  };
}
