{ mkDerivation, base, bytestring, cond, containers, directory
, doctest, exceptions, fetchgit, filepath, foldl, hspec, lens, lzma, mtl
, optparse-applicative, path, path-io, process-streaming, resourcet
, stdenv, streaming, streaming-bytestring, system-filepath, tar
, template-haskell, temporary, text, time, transformers, unrar
}:
mkDerivation {
  pname = "fm-assistant";
  version = "0.6.0.0";
  src = fetchgit {
    url = git://github.com/dhess/fm-assistant;
    rev = "861d0359e5f373a533296ab1742d329d5614813e";
    sha256 = "1a47zkh3a881m13jz2blfnxj9z4z71rvw08dh0v8cr28i1s4333z";
  };
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    base bytestring cond containers directory exceptions filepath foldl
    lens lzma mtl path path-io process-streaming resourcet streaming
    streaming-bytestring system-filepath tar template-haskell temporary
    text time transformers
  ];
  executableHaskellDepends = [
    base bytestring cond containers directory exceptions filepath foldl
    lens lzma mtl optparse-applicative path path-io process-streaming
    resourcet streaming streaming-bytestring system-filepath tar
    template-haskell temporary text time transformers unrar
  ];
  testHaskellDepends = [
    base bytestring cond containers directory doctest exceptions
    filepath foldl hspec lens lzma mtl path path-io process-streaming
    resourcet streaming streaming-bytestring system-filepath tar
    template-haskell temporary text time transformers
  ];
  license = stdenv.lib.licenses.bsd3;
}
