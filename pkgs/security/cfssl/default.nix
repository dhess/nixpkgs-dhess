{ stdenv, buildGoPackage, fetchFromGitHub }:

buildGoPackage rec {
  name = "cfssl-${version}";
  version = "1.3.2";

  goPackagePath = "github.com/cloudflare/cfssl";

  src = fetchFromGitHub {
    owner = "cloudflare";
    repo = "cfssl";
    rev = "5d63dbd981b5c408effbb58c442d54761ff94fbd";
    sha256 = "0j2gz2vl2pf7ir7sc7jrwmjnr67hk4qhxw09cjx132jbk337jc9x";
  };

  meta = with stdenv.lib; {
    homepage = https://cfssl.org/;
    description = "Cloudflare's PKI and TLS toolkit";
    platforms = platforms.all;
    license = licenses.bsd2;
    maintainers = with maintainers; [ dhess-pers ];
  };
}
