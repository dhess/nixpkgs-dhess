self: super:

let

  inherit (super) callPackage buildEnv;

in rec
{

  crosstool-ng-xtensa = callPackage ../pkgs/crosstool-ng-xtensa {};
  xtensa-esp32-toolchain = callPackage ../pkgs/xtensa-esp32-toolchain {};

  esp-idf-env = buildEnv {
    name = "esp-idf-env";
    paths = [
      xtensa-esp32-toolchain
    ];
  };

}
