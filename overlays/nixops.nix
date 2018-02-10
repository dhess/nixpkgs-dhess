self: super:

let

  inherit (super) buildEnv;

in
{
  nixops = super.callPackage ../pkgs/nixops {};

  nixops-env = buildEnv {
    name = "nixops-env";
    paths = [
      self.nixops
    ];
    meta.platforms = self.nixops.meta.platforms;
  };
}
