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

  ## Aggregates are handy for defining jobs (especially for subsets of
  ## platforms), but they don't provide very useful information in
  ## Hydra, especially when they die. We use aggregates here to define
  ## set of jobs, and then splat them into the output attrset so that
  ## they're more visible in Hydra.
  
  enumerateConstituents = aggregate: lib.listToAttrs (
    map (d:
           let
             name = (builtins.parseDrvName d.name).name;
             system = d.system;
           in
             { name = name + "." + system;
               value = d;
             }
         )
        aggregate.constituents
  );

  jobs = {

    x86_64-darwin = pkgs.releaseTools.aggregate {
      name = "nixpkgs-dhess-x86_64-darwin";
      meta.description = "nixpkgs-dhess overlay packages (x86_64-darwin)";
      meta.maintainer = lib.maintainers.dhess;
      constituents = with jobs; [
        ansible-env.x86_64-darwin
        emacs-env.x86_64-darwin
        esp-idf-env.x86_64-darwin
        haskell-env.x86_64-darwin
        nixops-env.x86_64-darwin
        nixtools-env.x86_64-darwin
        nodejs-env.x86_64-darwin
        opsec-env.x86_64-darwin
        perl-env.x86_64-darwin
        python-env.x86_64-darwin
        selenium-env.x86_64-darwin
        shell-env.x86_64-darwin

        # Stuff that's not in a buildEnv.
        nix.x86_64-darwin
        cacert.x86_64-darwin
      ];
    };

  } // (mapTestOn (packagePlatforms pkgs));

in
{
  inherit (jobs) x86_64-darwin;
}
// enumerateConstituents jobs.x86_64-darwin
