self: super:

let

  inherit (super) callPackage;

in rec
{

  lib = super.lib // rec {

    maintainers = super.lib.maintainers // {
      dhess-pers = "Drew Hess <src@drewhess.com>";
    };

  };

}
