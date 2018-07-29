self: super:

let

  inherit (super) callPackage buildEnv;
  inherit (self) lib;

in
{

  cfssl = callPackage ../pkgs/security/cfssl {};

  security-env = buildEnv {
    name = "security-env";
    paths = [
      self.cfssl
    ];
    meta.platforms = [ "x86_64-linux" "x86_64-darwin" ];
  };

}
