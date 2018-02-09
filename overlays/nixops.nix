self: super:

let

  inherit (super) buildEnv;
  targetSystem = super.targetPlatform.system;
  fixedNixOps = (import ../lib.nix).fetchNixOps;

in
{
  nixops = (import "${fixedNixOps}/release.nix" {}).build.${targetSystem};

  nixops-env = buildEnv {
    name = "nixops-env";
    paths = [
      self.nixops
    ];
    meta.platforms = self.lib.platforms.unix;
  };
}
