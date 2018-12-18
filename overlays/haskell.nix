self: super:

let

  inherit (super) buildEnv;
  inherit (self) haskell;

  exe = haskell.lib.justStaticExecutables;
  mkHaskellPaths = hp: packageList: with hp; [
    (ghcWithHoogle packageList)
    (exe cabal-install)
    #(exe dash-haskell)
    #(exe ghc-mod)
    (exe hindent)
    (exe hpack)
    (exe structured-haskell-mode)
    (exe stylish-haskell)
  ];

in
{

  haskell-env = buildEnv {
    name = "haskell-env";
    paths = mkHaskellPaths self.haskellPackages self.coreHaskellPackages;
    meta.platforms = self.haskellPackages.ghc.meta.platforms;
  };

  extensive-haskell-env = buildEnv {
    name = "extensive-haskell-env";
    paths = mkHaskellPaths self.haskellPackages self.extensiveHaskellPackages;
    meta.platforms = self.haskellPackages.ghc.meta.platforms;
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
