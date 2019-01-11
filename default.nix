# From GitHub: mozilla/nixpkgs-mozilla/default.nix.

self: super:

let

  localLib = import ./lib.nix;

in

with super.lib;

(foldl' (flip extends) (_: super) [
  (import localLib.fetchNixPkgsQuixoftic)
  (import localLib.fetchNixPkgsLibQuixoftic)

  (import ./overlays/cacert.nix)
  (import ./overlays/dhall.nix)
  (import ./overlays/emacs.nix)
  (import ./overlays/haskell-packages.nix)
  (import ./overlays/mactools.nix)
  (import ./overlays/nixtools.nix)
  (import ./overlays/opsec.nix)
  (import ./overlays/shell.nix)
]) self
