self: super:

let

  inherit (super) buildEnv;

in
{

  terraform-env = buildEnv {
    name = "terraform-env";
    paths = [
      self.terraform-full
    ];
    meta.platforms = super.terraform.meta.platforms;
  };

}
