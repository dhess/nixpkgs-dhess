self: super:

let

  inherit (super) buildEnv;

in
{
  dhall-env = buildEnv {
    name = "dhall-env";
    paths = [
      super.dhall
      # Already included by haskellEnv.
      #super.dhall-nix
      #super.dhall-json
    ];
    meta.platforms = super.dhall.meta.platforms;
  };
}
