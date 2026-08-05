{
  nixpkgs,
}:

{
  generateHost = import ./generateHost.nix {
    inherit nixpkgs;
  };
}
