let

  lib = import ../lib.nix;
  fixedNixPkgs = lib.fetchNixPkgs;
  packageSet = (import fixedNixPkgs);

in

{ supportedSystems ? [ "x86_64-darwin" "x86_64-linux" ]
, scrubJobs ? true
, nixpkgsArgs ? {
    config = { allowUnfree = true; inHydra = true; };
    overlays = [
      (import ../.)
    ];
  }
}:

with import (fixedNixPkgs + "/pkgs/top-level/release-lib.nix") {
  inherit supportedSystems scrubJobs nixpkgsArgs packageSet;
};

let

  jobs = {

    ## Core packages.

    x86_64-darwin = pkgs.releaseTools.aggregate {
      name = "nixpkgs-dhess-x86_64-darwin";
      meta.description = "nixpkgs-dhess overlay packages, core set (x86_64-darwin)";
      meta.maintainer = lib.maintainers.dhess;
      constituents = with jobs; [
        emacs-macport-env.x86_64-darwin
        mactools-env.x86_64-darwin
        nixtools-env.x86_64-darwin
        opsec-env.x86_64-darwin
        shell-env.x86_64-darwin

        # Stuff that's not in a buildEnv.
        nix.x86_64-darwin
        cacert.x86_64-darwin
      ];
    };

    x86_64-linux = pkgs.releaseTools.aggregate {
      name = "nixpkgs-dhess-x86_64-linux";
      meta.description = "nixpkgs-dhess overlay packages, core set (x86_64-linux)";
      meta.maintainer = lib.maintainers.dhess;
      constituents = with jobs; [
        emacs-nox-env.x86_64-linux
        nixtools-env.x86_64-linux
        opsec-env.x86_64-linux
        shell-env.x86_64-linux

        # Stuff that's not in a buildEnv.
        nix.x86_64-linux
        cacert.x86_64-linux
      ];
    };
  } // (mapTestOn (packagePlatforms pkgs));

in
{
  inherit (jobs) x86_64-darwin;
  inherit (jobs) x86_64-linux;
}
// pkgs.lib.testing.enumerateConstituents jobs.x86_64-darwin
// pkgs.lib.testing.enumerateConstituents jobs.x86_64-linux
