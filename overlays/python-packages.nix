self: super:

let

  inherit (super) callPackage;

  pythonOverrides = python: python.override {
    packageOverrides = self: super: with python.lib; rec {

      # Disable tests.
      notebook = super.notebook.overridePythonAttrs (old: { doCheck = false; });
      pyserial = super.pyserial.overridePythonAttrs (old: { doCheck = false; });
      send2trash = super.send2trash.overridePythonAttrs (old: { doCheck = false; });

      # New packages.
      onkyo-eiscp = callPackage ../pkgs/python/onkyo-eiscp {};

    };
  };

in
{
  python = pythonOverrides super.python;
  pythonPackages = self.python.pkgs;

  python3 = pythonOverrides super.python3;
  python3Packages = self.python3.pkgs;

  python36 = pythonOverrides super.python36;
  python36Packages = self.python36.pkgs;
}
