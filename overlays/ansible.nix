# My attempts at making a nice, self-contained Ansible
# environment. Unfortunately, it is limited by Ansible's
# braindead insistence that you use the system Python, which
# means that Ansible can't see any Python modules we install in
# the environment.
#
# So, at the moment, this isn't particularly useful until I
# figure out some way to override Ansible's use of system Python.

self: super:

let

  inherit (super) buildEnv;
  inherit (self) python pythonPackages;

in
{

  ansible-python-env = python.buildEnv.override {
    extraLibs = with pythonPackages; [
    ];
  };

  ansible-env = buildEnv {
    name = "ansible-env";
    paths = [
      self.ansible2
      self.ansible-python-env
    ];
    meta.platforms = super.ansible2.meta.platforms;
  };

}
