self: super:

let

  inherit (super) buildEnv;

in
{
  nodejs-env = buildEnv {
    name = "nodejs-env";
    paths = with super; [ nodejs-6_x ] ++ (with super.nodePackages; [
    ]);
    meta.platforms = super.nodejs-6_x.meta.platforms;
  };
}
