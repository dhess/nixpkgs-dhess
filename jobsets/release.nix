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

    # Special cases here.

  } // (mapTestOn (packagePlatforms pkgs));

in
{
  inherit (jobs) libuv;
}
