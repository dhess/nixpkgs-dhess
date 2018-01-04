self: super:

let
  inherit (super) stdenv haskell;

  lib = import ../pkgs/haskell/lib.nix {
    inherit (super) lib;
  };

in
rec {
  haskellPackages784 = haskell.packages.ghc784.extend (self: super:
    with haskell.lib;
    rec {
      Cabal = super.Cabal_1_24_2_0;
      cabal-install = self.callPackage ../pkgs/haskell/cabal-install-1.24.2.nix {};
      mtl = super.mtl_2_2_1;
      transformers-compat = doJailbreak (super.transformers-compat.overrideScope (self: super: { mtl = super.mtl_2_2_1; }));
    }
  );

  installedHaskellPackages784 =
  let
    problems = hp: with hp; [
    ];
  in
    lib.mkInstalledPackages problems;
}
