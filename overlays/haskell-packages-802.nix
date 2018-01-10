self: super:

let

  inherit (self) haskell;

  lib = import ../pkgs/haskell/lib.nix {
    inherit (self) lib;
  };

in
{

  haskellPackages802 = haskell.packages.ghc802.extend (self: super:
    with haskell.lib;
    rec {
      # Override cabal-install because Stack needs this older version,
      # and this is pretty much the only reason I use GHC 8.0.2
      # anymore.
      Cabal = super.Cabal_1_24_2_0;
      cabal-install = self.callPackage ../pkgs/haskell/cabal-install-1.24.2.nix {};

      Lykah = doJailbreak super.Lykah;
      clay = doJailbreak super.clay;
      concurrent-machines = doJailbreak super.concurrent-machines;
      filesystem-trees = doJailbreak super.filesystem-trees;
      ghc-exactprint = dontCheck super.ghc-exactprint;
      hakyll = doJailbreak super.hakyll;
      katip = doJailbreak super.katip;
      katip-elasticsearch = doJailbreak (dontCheck super.katip-elasticsearch);
      lzma = doJailbreak super.lzma;
      machines-process = doJailbreak super.machines-process;
      monad-log = doJailbreak super.monad-log;
      pipes-errors = doJailbreak super.pipes-errors;
      process-extras = dontCheck super.process-extras;
      shelly = doJailbreak super.shelly;
      store = dontCheck super.store;
      swagger2 = dontHaddock super.swagger2;
      these = doJailbreak super.these;
      time-recurrence = doJailbreak super.time-recurrence;
      wires = doJailbreak super.wires;
    }
  );

  installedHaskellPackages802 =
  let
    problems = hp: with hp; [
      dhall-nix
      llvm-general
      pipes-shell
      pipes-zlib
      sbv
      singletons
      wires
      uniqueid
    ];
  in
    lib.mkInstalledPackages problems;

}
