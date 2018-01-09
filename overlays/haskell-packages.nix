self: super:

let

  inherit (super) haskell;

  lib = import ../pkgs/haskell/lib.nix {
    inherit (super) lib;
  };

  problems = hp: with hp; [
    llvm-general
    pipes-shell
    pipes-zlib
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
      filesystem-trees = doJailbreak super.filesystem-trees;
      hakyll = doJailbreak super.hakyll;
      katip-elasticsearch = dontCheck super.katip-elasticsearch;
      lzma = doJailbreak super.lzma;
      machines-process = doJailbreak super.machines-process;
      monad-log = doJailbreak super.monad-log;
      pipes-errors = doJailbreak super.pipes-errors;
      pipes-transduce = dontCheck super.pipes-transduce;
      repline = doJailbreak super.repline;
      shelly = dontCheck (doJailbreak super.shelly);
      streaming-utils = doJailbreak super.streaming-utils;
      text-show = dontCheck super.text-show;
      these = doJailbreak super.these;
      time-recurrence = doJailbreak super.time-recurrence;
      wires = doJailbreak super.wires;

    }
  );

  coreHaskellPackages = lib.mkInstalledPackages corePackages problems;
  extensiveHaskellPackages = lib.mkInstalledPackages extensivePackages problems;

}
