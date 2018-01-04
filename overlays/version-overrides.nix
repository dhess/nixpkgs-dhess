self: super:

let

  inherit (super) callPackage;

in rec
{

  # lftp 4.8.3
  lftp = callPackage ../pkgs/lftp {};

}
