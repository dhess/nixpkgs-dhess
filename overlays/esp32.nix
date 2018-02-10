self: super:

let

  inherit (super) callPackage buildEnv;
  inherit (self) lib;

in
{

  crosstool-ng-xtensa = callPackage ../pkgs/crosstool-ng-xtensa {};
  xtensa-esp32-toolchain = callPackage ../pkgs/xtensa-esp32-toolchain {};

  esp-idf-env = buildEnv {
    name = "esp-idf-env";
    paths = [
      self.xtensa-esp32-toolchain
    ];
    meta.platforms = [ "x86_64-linux" "x86_64-darwin" ];
  };

}
