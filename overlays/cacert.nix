self: super:

let

  drewHessCAPem = (builtins.readFile ../static/drewhess-ca.pem);
  drewHessCACerts = {
    "Drew Hess Certificate Authority" = drewHessCAPem;
  };

  inherit (self) lib;

in
{

  # I want everything in Nixpkgs to accept my personal CA's
  # certificates.

  cacert = lib.mkCacert { inherit (super) cacert; extraCerts = drewHessCACerts; };

}
