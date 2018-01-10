self: super:

let

  inherit (super) buildEnv;
  inherit (self) nodejs-6_x;

in
{
  nodejs-env = buildEnv {
    name = "nodejs-env";
    paths = [ nodejs-6_x ] ++ (with self.nodePackages; [
    ]);
    meta.platforms = nodejs-6_x.meta.platforms;
  };
}
