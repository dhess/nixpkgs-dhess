self: super:

let

  inherit (super) lib buildEnv haskell;

in rec
{

  haskell-env = haskell822-env;

  haskell822-env = buildEnv {
    name = "haskell822-env";
    paths = with self.haskellPackages; [
      (ghcWithHoogle self.installedHaskellPackages)

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
    meta.platforms = self.haskellPackages.ghc.meta.platforms;
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
    meta.platforms = self.haskellPackages802.ghc.meta.platforms;
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
    meta.platforms = self.haskellPackages7103.ghc.meta.platforms;
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
    meta.platforms = self.haskellPackages784.ghc.meta.platforms;
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
    meta.platforms = self.stack.meta.platforms;
  };

}
