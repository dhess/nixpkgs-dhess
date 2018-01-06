self: super:

let

  inherit (super) buildEnv;
  inherit (self) perlPackages;

in
{
  # Note that, unlike with Python, Nix perl will not find its packages
  # automatically. You must set $PERL5LIB to
  # $HOME/.nix-profile/lib/perl5/site_perl

  perl-env = buildEnv {
    name = "perl-env";
    paths = with perlPackages; [
      perl
      DevelTrace
      FileCopyRecursive
    ];
    meta.platforms = super.perlPackages.perl.meta.platforms;
  };
}
