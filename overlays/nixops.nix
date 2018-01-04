self: super:

let

  inherit (super) buildEnv;

in
{
  nixops-env = buildEnv {
    name = "nixops-env";
    paths = with self; [
      nixops
    ];
  };
}
