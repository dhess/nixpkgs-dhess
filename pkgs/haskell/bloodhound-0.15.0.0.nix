{ mkDerivation, aeson, base, blaze-builder, bytestring, containers
, data-default-class, errors, exceptions, generics-sop, hashable
, hspec, http-client, http-types, mtl, mtl-compat, network-uri
, QuickCheck, quickcheck-properties, scientific, semigroups, stdenv
, temporary, text, time, transformers, unix-compat
, unordered-containers, vector
}:
mkDerivation {
  pname = "bloodhound";
  version = "0.15.0.0";
  sha256 = "05q2zxmrxxqmi4vr98dvgfly8gir5h4iaimb3lwiflk0pw8nfn6n";
  libraryHaskellDepends = [
    aeson base blaze-builder bytestring containers data-default-class
    exceptions hashable http-client http-types mtl mtl-compat
    network-uri scientific semigroups text time transformers
    unordered-containers vector
  ];
  testHaskellDepends = [
    aeson base bytestring containers errors exceptions generics-sop
    hspec http-client http-types mtl network-uri QuickCheck
    quickcheck-properties semigroups temporary text time unix-compat
    unordered-containers vector
  ];
  doCheck = false;
  homepage = "https://github.com/bitemyapp/bloodhound";
  description = "ElasticSearch client library for Haskell";
  license = stdenv.lib.licenses.bsd3;
}
