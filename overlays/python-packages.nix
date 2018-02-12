self: super:

let

  inherit (super) callPackage;

  pythonOverrides = python: python.override {
    packageOverrides = self: super: with python.lib; rec {

      # Disable tests.
      pyserial = super.pyserial.overridePythonAttrs (old: { doCheck = false; });

      # New packages.
      onkyo-eiscp = callPackage ../pkgs/python/onkyo-eiscp {};

    };
  };

in
{
  python = pythonOverrides super.python;
  pythonPackages = self.python.pkgs;
}
