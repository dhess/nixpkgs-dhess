self: super:

let

  drewHessCAPem = (builtins.readFile ../static/Drew_Hess_CA_Root.pem);
  drewHessCACerts = {
    "Drew Hess Certificate Authority" = drewHessCAPem;
  };

  inherit (self) lib;

in
{

  # I want everything in Nixpkgs to accept my personal CA's
  # certificates.
  #
  # Note that passing super.cacert is needed here to avoid an infinite
  # recursion.

  cacert = lib.mkCacert { inherit (super) cacert; extraCerts = drewHessCACerts; };

}
