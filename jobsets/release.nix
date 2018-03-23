let

  fixedNixPkgs = (import ../lib.nix).fetchNixPkgs;
  fixedNixPkgsLibQuixoftic = (import ../lib.nix).fetchNixPkgsLibQuixoftic;

in

{ supportedSystems ? [ "x86_64-darwin" "x86_64-linux" ]
, scrubJobs ? true
, nixpkgsArgs ? {
    config = { allowUnfree = true; allowBroken = true; inHydra = true; };
    overlays = [
      (import ../.)
      (import fixedNixPkgsLibQuixoftic)
    ];
  }
}:

with import (fixedNixPkgs + "/pkgs/top-level/release-lib.nix") {
  inherit supportedSystems scrubJobs nixpkgsArgs;
};

let

  nixpkgs-lib-quixoftic = (import fixedNixPkgsLibQuixoftic) { self = {}; super = pkgs; };

  jobs = {

    ## Core packages.

    x86_64-darwin = pkgs.releaseTools.aggregate {
      name = "nixpkgs-dhess-x86_64-darwin";
      meta.description = "nixpkgs-dhess overlay packages, core set (x86_64-darwin)";
      meta.maintainer = lib.maintainers.dhess;
      constituents = with jobs; [
        ansible-env.x86_64-darwin
        emacs-env.x86_64-darwin
        esp-idf-env.x86_64-darwin
        haskell-env.x86_64-darwin
        mactools-env.x86_64-darwin
        nixops-env.x86_64-darwin
        nixtools-env.x86_64-darwin
        nodejs-env.x86_64-darwin
        opsec-env.x86_64-darwin
        perl-env.x86_64-darwin
        python-env.x86_64-darwin
        selenium-env.x86_64-darwin
        shell-env.x86_64-darwin
        stack-env.x86_64-darwin
        tex-env.x86_64-darwin

        # Stuff that's not in a buildEnv.
        nix.x86_64-darwin
        nixUnstable.x86_64-darwin
        cacert.x86_64-darwin
      ];
    };


    ## Extra stuff. Once we have channels, we could advance the core
    ## set faster than this one, if this one has more build problems.

    x86_64-darwin-extra = pkgs.releaseTools.aggregate {
      name = "nixpkgs-dhess-x86_64-darwin-extra";
      meta.description = "nixpkgs-dhess overlay packages, extras (x86_64-darwin)";
      meta.maintainer = lib.maintainers.dhess;
      constituents = with jobs; [
        extensive-haskell-env.x86_64-darwin
        extensive-ihaskell-env.x86_64-darwin
        ihaskell-env.x86_64-darwin
      ];
    };

    x86_64-linux = pkgs.releaseTools.aggregate {
      name = "nixpkgs-dhess-x86_64-linux";
      meta.description = "nixpkgs-dhess overlay packages, core set (x86_64-linux)";
      meta.maintainer = lib.maintainers.dhess;
      constituents = with jobs; [
        emacs-env.x86_64-linux
        esp-idf-env.x86_64-linux
        haskell-env.x86_64-linux
        nixops-env.x86_64-linux
        nixtools-env.x86_64-linux
        nodejs-env.x86_64-linux
        opsec-env.x86_64-linux
        perl-env.x86_64-linux
        python-env.x86_64-linux
        shell-env.x86_64-linux
        stack-env.x86_64-linux
        tex-env.x86_64-linux

        # Stuff that's not in a buildEnv.
        nix.x86_64-linux
        nixUnstable.x86_64-linux
        cacert.x86_64-linux
      ];
    };


    ## Extra stuff. Once we have channels, we could advance the core
    ## set faster than this one, if this one has more build problems.

    x86_64-linux-extra = pkgs.releaseTools.aggregate {
      name = "nixpkgs-dhess-x86_64-linux-extra";
      meta.description = "nixpkgs-dhess overlay packages, extras (x86_64-linux)";
      meta.maintainer = lib.maintainers.dhess;
      constituents = with jobs; [
        extensive-haskell-env.x86_64-linux
      ];
    };

  } // (mapTestOn (packagePlatforms pkgs));

in
{
  inherit (jobs) x86_64-darwin;
  inherit (jobs) x86_64-darwin-extra;
  inherit (jobs) x86_64-linux;
  inherit (jobs) x86_64-linux-extra;
}
// pkgs.lib.testing.enumerateConstituents jobs.x86_64-darwin
// pkgs.lib.testing.enumerateConstituents jobs.x86_64-darwin-extra
// pkgs.lib.testing.enumerateConstituents jobs.x86_64-linux
// pkgs.lib.testing.enumerateConstituents jobs.x86_64-linux-extra
