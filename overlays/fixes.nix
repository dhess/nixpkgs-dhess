self: super:

let

  inherit (super) callPackage;

in
{
  # https://github.com/NixOS/nixpkgs/pull/52014
  # Currently in staging, so reproduced here.
  valgrind = callPackage ../pkgs/valgrind {
    inherit (super.buildPackages.darwin) xnu bootstrap_cmds cctools;
  };
  valgrind-light = self.valgrind.override { gdb = null; };
}
