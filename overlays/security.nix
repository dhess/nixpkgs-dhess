self: super:

let

  inherit (super) callPackage buildEnv;
  inherit (self) lib;

in
{

  cfssl = super.cfssl.overrideAttrs (oldAttrs: {
    meta.platforms = oldAttrs.meta.platforms ++ [ "x86_64-darwin" ];
  });

  security-env = buildEnv {
    name = "security-env";
    paths = [
      self.cfssl
    ];
    meta.platforms = [ "x86_64-linux" "x86_64-darwin" ];
  };

}
