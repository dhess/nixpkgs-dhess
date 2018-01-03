# Broken tests.

self: super:

let
  overrideDerivation = super.stdenv.lib.overrideDerivation;
in
{

  ## Broken on macOS.
  #

  libuv = overrideDerivation super.libuv (oldAttrs : {
    doCheck = false;
  });

}
