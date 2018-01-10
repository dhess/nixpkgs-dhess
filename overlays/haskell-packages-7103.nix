self: super:

let

  inherit (self) haskell;

  lib = import ../pkgs/haskell/lib.nix {
    inherit (self) lib;
  };

in
{

  haskellPackages7103 = haskell.packages.ghc7103.extend (self: super:
    with haskell.lib;
    rec {
      Cabal = super.Cabal_1_24_2_0;
      cabal-install = self.callPackage ../pkgs/haskell/cabal-install-1.24.2.nix {};
    }
  );

  installedHaskellPackages7103 =
  let
    problems = hp: with hp; [
    ];
  in
    lib.mkInstalledPackages problems;

}
