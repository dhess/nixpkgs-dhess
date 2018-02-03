{ stdenv, fetchurl, lib, pythonPackages }:

pythonPackages.buildPythonApplication rec {
  name = "onkyo-eiscp-${version}";
  version = "1.2.4";

  src = fetchurl {
    url = "mirror://pypi/o/onkyo-eiscp/onkyo-eiscp-${version}.tar.gz";
    sha256 = "0qb5w2g2cnckq7psh92g1w3gf76437x1vwfhwnd247wshs5h7hxj";
  };

  propagatedBuildInputs = with pythonPackages; [ docopt netifaces ];

  meta = {
    homepage = "https://github.com/miracle2k/onkyo-eiscp";
    description = "Control Onkyo A/V receivers over the network";
    license = lib.licenses.mit;
    maintainers = [ lib.maintainers.dhess-pers ];
  };
}
