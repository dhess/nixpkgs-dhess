{ lib }:

rec {

  mkInstalledPackages = problems: hp: with hp;
  let
    desiredHaskellPackages = import ./haskell-packages.nix;
  in
    lib.subtractLists (problems hp) (desiredHaskellPackages hp);

}
