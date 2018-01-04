self: super:

let

  inherit (super) stdenv haskell;

  lib = import ../pkgs/haskell/lib.nix {
    inherit (super) lib;
  };

  problems = hp: with hp; [
    llvm-general
    pipes-shell
    pipes-zlib
    uniqueid
  ];

in
{

  haskellPackages822 = haskell.packages.ghc822.extend (self: super:
    with haskell.lib;
    rec {

      dhess-ssh-keygen = doJailbreak (self.callPackage ../pkgs/haskell/dhess-ssh-keygen.nix {});
      fm-assistant = dontCheck (self.callPackage ../pkgs/haskell/fm-assistant.nix {});

      Lykah = doJailbreak super.Lykah;
      bloodhound = dontCheck super.bloodhound_0_15_0_0;
      concurrent-machines = doJailbreak super.concurrent-machines;
      configuration-tools = super.configuration-tools_0_3_0;
      filesystem-trees = doJailbreak super.filesystem-trees;
      hakyll = doJailbreak super.hakyll;
      hpack = super.hpack_0_20_0.overrideScope (self: super: {
        Glob = doJailbreak super.Glob;
        HUnit = super.HUnit_1_6_0_0;
      });
      katip-elasticsearch = dontCheck super.katip-elasticsearch;
      lzma = doJailbreak super.lzma;
      machines-process = doJailbreak super.machines-process;
      monad-log = doJailbreak super.monad-log;
      pandoc-citeproc = super.pandoc-citeproc_0_12_1;
      pipes-errors = doJailbreak super.pipes-errors;
      repline = doJailbreak super.repline;
      shelly = doJailbreak super.shelly;
      singletons = dontCheck super.singletons_2_3_1;
      th-desugar = super.th-desugar_1_7;
      these = doJailbreak super.these;
      time-recurrence = doJailbreak super.time-recurrence;
      wires = doJailbreak super.wires;

    }
  );

  installedHaskellPackages822 = lib.mkInstalledPackages problems;

}
