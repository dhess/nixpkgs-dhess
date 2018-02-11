self: super:

let

  localLib = import ../lib.nix;
  fixedNixPkgs = localLib.fetchNixPkgs;
  fixedNixOps = localLib.fetchNixOps;

in
{
  nixops-tarball = (super.nixops-tarball or (
    (import "${fixedNixOps}/release.nix" {
      nixpkgs = fixedNixPkgs;
    }).tarball
  ));
}
