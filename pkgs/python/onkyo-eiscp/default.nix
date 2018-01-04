{ stdenv, fetchurl, lib, pythonPackages }:

pythonPackages.buildPythonApplication rec {
  name = "onkyo-eiscp-${version}";
  version = "1.0";

  src = fetchurl {
    url = "mirror://pypi/o/onkyo-eiscp/onkyo-eiscp-${version}.tar.gz";
    sha256 = "173zxfq2xnsdkpc18np0d5253f1j81s58gxvryk3dqs3s9cv71k2";
  };

  propagatedBuildInputs = with pythonPackages; [ docopt netifaces ];

  meta = {
    homepage = "https://github.com/miracle2k/onkyo-eiscp";
    description = "Control Onkyo A/V receivers over the network";
    license = lib.licenses.mit;
    maintainers = [ lib.maintainers.dhess-pers ];
  };
}
