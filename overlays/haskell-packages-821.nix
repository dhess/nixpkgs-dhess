self: super:

let
  inherit (super) stdenv haskell;

  lib = import ../pkgs/haskell/lib.nix {
    inherit (super) lib;
  };

in
{
  haskellPackages821 = haskell.packages.ghc821.extend (self: super:
    with haskell.lib;
    rec {
      dhess-ssh-keygen = doJailbreak (self.callPackage ../pkgs/haskell/dhess-ssh-keygen.nix {});
      fm-assistant = dontCheck (self.callPackage ../pkgs/haskell/fm-assistant.nix {});
      hpio = self.callPackage ../pkgs/haskell/hpio-0.9.0.0.nix {};
      bloodhound = self.callPackage ../pkgs/haskell/bloodhound-0.15.0.0.nix {};

      Lykah = doJailbreak super.Lykah;
      clay = doJailbreak super.clay;
      concurrent-machines = doJailbreak super.concurrent-machines;
      configuration-tools = super.configuration-tools_0_3_0;
      filesystem-trees = doJailbreak super.filesystem-trees;
      ghc-exactprint = dontCheck super.ghc-exactprint;
      hakyll = doJailbreak super.hakyll;
      katip = doJailbreak super.katip;
      katip-elasticsearch = doJailbreak (dontCheck super.katip-elasticsearch);
      lzma = doJailbreak super.lzma;
      machines-process = doJailbreak super.machines-process;
      monad-log = doJailbreak super.monad-log;
      pandoc-citeproc = super.pandoc-citeproc_0_12_1;
      pipes-errors = doJailbreak super.pipes-errors;
      process-extras = dontCheck super.process-extras;
      protolude = super.protolude_0_2;
      shelly = doJailbreak super.shelly;
      singletons = dontCheck super.singletons_2_3_1;
      store = dontCheck super.store;
      swagger2 = dontHaddock super.swagger2;
      th-desugar = super.th-desugar_1_7;
      these = doJailbreak super.these;
      time-recurrence = doJailbreak super.time-recurrence;
      wires = doJailbreak super.wires;
    }
  );

  installedHaskellPackages821 =
  let
    problems = hp: with hp; [
      llvm-general
      pipes-shell
      pipes-zlib
      repline
      uniqueid
    ];
  in
    lib.mkInstalledPackages problems;
}
