self: super:

let
  inherit (super) stdenv haskell;

  lib = import ../pkgs/haskell/lib.nix {
    inherit (super) lib;
  };

in
rec {
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
