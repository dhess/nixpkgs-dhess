# From GitHub: mozilla/nixpkgs-mozilla/default.nix.

self: super:

with super.lib;

(foldl' (flip extends) (_: super) [

  (import ./overlays/disable-tests.nix)
  (import ./overlays/lib.nix)

]) self
