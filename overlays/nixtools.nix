self: super:

let

  inherit (super) lib buildEnv;

in
{
  nixtools-env = buildEnv {
    name = "nixtools-env";
    paths = with super; [
      cabal2nix
      nix-index
      nix-info
      nix-repl
      nox
      pypi2nix
    ];
    meta.platforms = lib.platforms.all;
  };
}
