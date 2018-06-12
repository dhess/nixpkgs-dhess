self: super:

let

  inherit (self) haskell;

  lib = import ../pkgs/haskell/lib.nix {
    inherit (self) lib;
  };

  problems = hp: with hp; [
    concurrent-machines
    haxl-amazonka
    llvm-general
    parsec-free
    pipes-shell
    pipes-zlib
    stm-containers
    uniqueid
  ];

  corePackages = import ../pkgs/haskell/core-haskell-packages.nix;
  extensivePackages = import ../pkgs/haskell/extensive-haskell-packages.nix { inherit corePackages; };

in
{

  haskellPackages = super.haskellPackages.extend (self: super:
    with haskell.lib;
    rec {

      dhess-ssh-keygen = doJailbreak (self.callPackage ../pkgs/haskell/dhess-ssh-keygen.nix {});
      fm-assistant = dontCheck (self.callPackage ../pkgs/haskell/fm-assistant.nix {});

      Lykah = doJailbreak super.Lykah;
      concurrent-machines = doJailbreak super.concurrent-machines;
      foldl = super.foldl_1_4_0;
      filesystem-trees = doJailbreak super.filesystem-trees;
      hakyll = doJailbreak super.hakyll;
      hpio = dontCheck super.hpio;
      katip-elasticsearch = dontCheck super.katip-elasticsearch;
      lzma = doJailbreak super.lzma;
      machines-process = doJailbreak super.machines-process;
      monad-log = doJailbreak super.monad-log;
      pipes-errors = doJailbreak super.pipes-errors;
      pipes-group = doJailbreak super.pipes-group;
      pipes-transduce = dontCheck super.pipes-transduce;
      repline = doJailbreak super.repline;
      shelly = dontCheck (doJailbreak super.shelly);
      stm-containers = doJailbreak super.stm-containers;
      streaming-utils = doJailbreak super.streaming-utils;
      text-show = dontCheck super.text-show;
      these = doJailbreak super.these;
      time-recurrence = doJailbreak super.time-recurrence;
      wires = doJailbreak super.wires;

    }
  );

  coreHaskellPackages = lib.mkInstalledPackages corePackages problems;
  extensiveHaskellPackages = lib.mkInstalledPackages extensivePackages problems;

  core-ihaskell = super.ihaskell.override {
    packages = self.coreHaskellPackages;
  };

  extensive-ihaskell = super.ihaskell.override {
    packages = self.extensiveHaskellPackages;
  };

  fm-assistant = haskell.lib.justStaticExecutables (self.haskellPackages.fm-assistant);
}
