{ mkDerivation, base, Cabal, stdenv }:
mkDerivation {
  pname = "jailbreak-cabal";
  version = "1.3.3";
  sha256 = "6bac08ad1a1ff7452a2963272f96f5de0a3df200fb3219dde6ee93e4963dd01c";
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base Cabal ];
  homepage = "https://github.com/peti/jailbreak-cabal#readme";
  description = "Strip version restrictions from Cabal files";
  license = stdenv.lib.licenses.bsd3;
}
