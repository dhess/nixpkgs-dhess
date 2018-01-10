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
      nix-repl
      nix-serve
      nox
      pypi2nix
    ];
    meta.platforms = lib.platforms.all;
  };
}
