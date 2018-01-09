self: super:

let

  inherit (super) lib buildEnv haskell;

in rec
{

  haskell-env = buildEnv {
    name = "haskell-env";
    paths = with self.haskellPackages; [
      (ghcWithHoogle self.coreHaskellPackages)

      cabal-install
      #dash-haskell
      #ghc-mod
      hindent
      hpack
      structured-haskell-mode
      stylish-haskell
    ];
    meta.platforms = self.haskellPackages.ghc.meta.platforms;
  };

  extensive-haskell-env = buildEnv {
    name = "extensive-haskell-env";
    paths = with self.haskellPackages; [
      (ghcWithHoogle self.extensiveHaskellPackages)

      cabal-install
      #dash-haskell
      #ghc-mod
      hindent
      hpack
      structured-haskell-mode
      stylish-haskell
    ];
    meta.platforms = self.haskellPackages.ghc.meta.platforms;
  };

  haskell802-env = buildEnv {
    name = "haskell802-env";
    paths = with self.haskellPackages802; [
      (ghcWithHoogle self.coreHaskellPackages802)

      cabal-install
      #dash-haskell
      ghc-mod
      hindent
      hpack
      structured-haskell-mode
      stylish-haskell
    ];
    meta.platforms = self.haskellPackages802.ghc.meta.platforms;
  };

  haskell7103-env = buildEnv {
    name = "haskell7103-env";
    paths = with self.haskellPackages7103; [
      (ghcWithPackages self.coreHaskellPackages7103)

      cabal-install
      #dash-haskell
      hindent
      hpack
      structured-haskell-mode
      stylish-haskell
    ];
    meta.platforms = self.haskellPackages7103.ghc.meta.platforms;
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
