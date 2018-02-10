self: super:

let

  inherit (super) buildEnv;
  inherit (self) nixops;

in
{
  nixops-env = buildEnv {
    name = "nixops-env";
    paths = [
      nixops
    ];
    meta.platforms = nixops.meta.platforms;
  };
}
