self: super:

let

  inherit (super) buildEnv haskell;

in rec
{

  haskell822-env = buildEnv {
    name = "haskell822-env";
    paths = with self.haskellPackages822; [
      (ghcWithHoogle self.installedHaskellPackages822)

      cabal-install
      #dash-haskell
      #ghc-mod
      hindent
      hlint
      hpack
      hscolour
      structured-haskell-mode
      stylish-haskell
    ];
  };

  haskell821-env = buildEnv {
    name = "haskell821-env";
    paths = with self.haskellPackages821; [
      (ghcWithHoogle self.installedHaskellPackages821)

      cabal-install
      #dash-haskell
      #ghc-mod
      hindent
      hlint
      hpack
      hscolour
      structured-haskell-mode
      stylish-haskell
    ];
  };

  haskell802-env = buildEnv {
    name = "haskell802-env";
    paths = with self.haskellPackages802; [
      (ghcWithHoogle self.installedHaskellPackages802)

      cabal-install
      #dash-haskell
      ghc-mod
      hindent
      hlint
      hpack
      hscolour
      structured-haskell-mode
      stylish-haskell
    ];
  };

  haskell7103-env = buildEnv {
    name = "haskell7103-env";
    paths = with self.haskellPackages7103; [
      (ghcWithPackages self.installedHaskellPackages7103)

      cabal-install
      #dash-haskell
      hindent
      hlint
      hpack
      hscolour
      structured-haskell-mode
      stylish-haskell
    ];
  };

  haskell784-env = buildEnv {
    name = "haskell784-env";
    paths = with self.haskellPackages784; [
      (ghcWithPackages self.installedHaskellPackages784)

      cabal-install
      #dash-haskell
      hindent
      hlint
      hpack
      hscolour
      structured-haskell-mode
      stylish-haskell
    ];
  };


  ## Stack environments.
  #
  # These are typically just stack, cabal-install, and a particular
  # GHC which corresponds to a particular Stackage LTS. There's no
  # real point in installing a bunch of Haskell packages since Stack
  # is just going to build them itself anyway.

  stack-env = buildEnv {
    name = "stack-env";
    paths = with self; [
      haskellPackages802.cabal-install
      stack
    ];
  };

}
