let

  fixedNixPkgs = (import ../lib.nix).fetchNixPkgs;

in

{ supportedSystems ? [ "x86_64-darwin" ]
, scrubJobs ? true
, nixpkgsArgs ? {
    config = { allowUnfree = true; allowBroken = true; inHydra = true; };
    overlays = [ (import ../.) ];
  }
}:

with import (fixedNixPkgs + "/pkgs/top-level/release-lib.nix") {
  inherit supportedSystems scrubJobs nixpkgsArgs;
};

let

  jobs = {

    x86_64-darwin = pkgs.releaseTools.aggregate {
      name = "nixpkgs-dhess-x86_64-darwin";
      meta.description = "nixpkgs-dhess overlay packages (x86_64-darwin)";
      meta.maintainer = lib.maintainers.dhess;
      constituents = with jobs; [
        emacs.x86_64-darwin
        haskellPackages.fm-assistant.x86_64-darwin
        haskellPackages.dhess-ssh-keygen.x86_64-darwin
        xtensa-esp32-toolchain.x86_64-darwin
      ];
    };

  } // (mapTestOn ((packagePlatforms pkgs) // rec {
    haskell.compiler = packagePlatforms pkgs.haskell.compiler;
    haskellPackages = packagePlatforms pkgs.haskellPackages;
  }));

in
{
  inherit (jobs) x86_64-darwin;
}
