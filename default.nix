# From GitHub: mozilla/nixpkgs-mozilla/default.nix.

self: super:

let

  localLib = import ./lib.nix;

in

with super.lib;

(foldl' (flip extends) (_: super) [

  (import localLib.fetchNixPkgsLibQuixoftic)

  (import ./overlays/ansible.nix)
  (import ./overlays/cacert.nix)
  (import ./overlays/disable-tests.nix)
  (import ./overlays/emacs.nix)
  (import ./overlays/esp32.nix)
  (import ./overlays/haskell-packages-7103.nix)
  (import ./overlays/haskell-packages-802.nix)
  (import ./overlays/haskell-packages.nix)
  (import ./overlays/haskell.nix)
  (import ./overlays/lib.nix)
  (import ./overlays/mactools.nix)
  (import ./overlays/misc.nix)
  (import ./overlays/nixtools.nix)
  (import ./overlays/nixops.nix)
  (import ./overlays/nodejs.nix)
  (import ./overlays/opsec.nix)
  (import ./overlays/perl.nix)
  (import ./overlays/python-packages.nix)
  (import ./overlays/python.nix)
  (import ./overlays/selenium.nix)
  (import ./overlays/shell.nix)
  (import ./overlays/version-overrides.nix)

]) self
