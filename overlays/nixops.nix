self: super:

let

  inherit (super) buildEnv;

in
{
  nixops-env = buildEnv {
    name = "nixops-env";
    paths = with super; [
      nixops
    ];
    meta.platforms = super.nixops.meta.platforms;
  };
}
