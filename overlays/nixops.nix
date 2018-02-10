self: super:

let

  inherit (super) buildEnv;
  localLib = import ../lib.nix;

in
{
  nixops =
    let
      targetSystem = super.targetPlatform.system;
      myNixOps = super.fetchFromGitHub {
        owner =  "dhess";
        repo =   "nixops";
        rev =    "5014e17f5ab9a6eb481b705efb9bb8e0def3b738";
        sha256 = "0rsn6xsr3hgy0szdim0if838bh1z7akbd4k8rik3bkmnwcrwlsgi";
      };
    in (import "${myNixOps}/release.nix" {
      nixpkgs = localLib.fetchNixPkgs;
    }).build.${targetSystem};

  nixops-env = buildEnv {
    name = "nixops-env";
    paths = [
      self.nixops
    ];
    meta.platforms = self.lib.platforms.unix;
  };
}
