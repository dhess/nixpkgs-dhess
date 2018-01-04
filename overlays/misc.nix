self: super:

let

  inherit (super) callPackage;

in rec
{

  unbound-block-hosts = callPackage ../pkgs/unbound-block-hosts {};

}
