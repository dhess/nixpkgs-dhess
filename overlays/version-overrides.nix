self: super:

let

  inherit (super) callPackage;

  inherit (callPackage ../pkgs/terraform {})
    terraform_0_11
    terraform_0_11-full
    ;

  terraform = terraform_0_11;
  terraform-full = terraform_0_11-full;

in
{
  inherit terraform_0_11 terraform_0_11-full;
  inherit terraform terraform-full;
}
