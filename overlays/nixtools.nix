self: super:

let

  inherit (super) buildEnv;
  inherit (self) lib;

in
{
  nixtools-env = buildEnv {
    name = "nixtools-env";
    paths = with self; [
      cabal2nix
      nix-index
      nix-info
      nox
    ];
    meta.platforms = lib.platforms.all;
  };
}
