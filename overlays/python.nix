self: super:

let

  inherit (super) python;
  inherit (self) pythonPackages;

in
{
  python-env = python.buildEnv.override {

    ignoreCollisions = true;
    extraLibs = with pythonPackages; [

      flake8
      importmagic
      ipython
      jedi
      pyserial
      virtualenvwrapper
      yapf

    ];

  };
}
