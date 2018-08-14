self: super:

let

  inherit (super) callPackage buildEnv;
  inherit (self) lib;

in
{

  security-env = buildEnv {
    name = "security-env";
    paths = [
      super.cfssl
    ];
    meta.platforms = [ "x86_64-linux" "x86_64-darwin" ];
  };

}
