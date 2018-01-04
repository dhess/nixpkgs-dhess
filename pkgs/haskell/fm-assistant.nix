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
    rev = "549a30d2d9841a63e84b28f66d0b2eb361131f7b";
    sha256 = "0kibvmdr7ij26n0zr65wkfl78h8k8xqsrhv1dzvjmsnrrks9l7b7";
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
