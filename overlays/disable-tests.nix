# Broken tests.

self: super:

let

  overrideDerivation = super.stdenv.lib.overrideDerivation;

in
{

  ## Left as an example.

  # libuv = overrideDerivation super.libuv (oldAttrs : {
  #   doCheck = false;
  # });

}
