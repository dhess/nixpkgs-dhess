{ lib }:

rec {

  mkInstalledPackages = desiredHaskellPackages: problems: hp: with hp;
    lib.subtractLists (problems hp) (desiredHaskellPackages hp);

}
