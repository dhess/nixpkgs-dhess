self: super:

let

  inherit (super) callPackage;

in
{

  unbound-block-hosts = callPackage ../pkgs/unbound-block-hosts {};

}
