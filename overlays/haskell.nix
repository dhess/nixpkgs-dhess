self: super:

let

  inherit (super) buildEnv;
  inherit (self) haskell;

in
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

  ihaskell-env = buildEnv {
    name = "ihaskell-env";
    paths = [
      self.core-ihaskell
    ];
    meta.platforms = self.lib.platforms.darwin;
  };

  extensive-ihaskell-env = buildEnv {
    name = "extensive-ihaskell-env";
    paths = [
      self.extensive-ihaskell
    ];
    meta.platforms = self.lib.platforms.darwin;
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
      cabal-install
      stack
    ];
    meta.platforms = self.stack.meta.platforms;
  };

}
