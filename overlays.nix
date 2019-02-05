let

  localLib = import ./lib.nix;

in
[
  localLib.fetchNixPkgsQuixoftic
  localLib.fetchNixPkgsLibQuixoftic
  ./overlays/cacert.nix
  ./overlays/haskell-packages.nix
  ./overlays/mactools.nix
  ./overlays/nixtools.nix
  ./overlays/opsec.nix
  ./overlays/shell.nix
]
