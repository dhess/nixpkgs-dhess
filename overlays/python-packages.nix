self: super:

let

  inherit (super) callPackage;
  inherit (self) python;

  my-python-packages = pp: pp.override {
    overrides = self: super: with python.lib; rec {

      # Disable tests.
      pyserial = super.pyserial.overridePythonAttrs(old: { doCheck = false; });

      # New packages.
      onkyo-eiscp = callPackage ../pkgs/python/onkyo-eiscp {};

    };
  };

in
{
  pythonPackages = my-python-packages super.pythonPackages;
}
