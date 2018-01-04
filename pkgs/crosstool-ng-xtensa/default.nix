{ stdenv
, lib
, fetchgit
, autoconf
, automake
, binutils-raw
, bison
, flex
, gettext
, git
, gperf
, help2man
, libtool
, ncurses
, texinfo
, which
, wget
}:

stdenv.mkDerivation rec {
  name = "crosstool-ng-xtensa-${version}";
  version = "20170110";

  src = fetchgit {
    url = "https://github.com/espressif/crosstool-NG.git";
    rev = "ab8375a958405b85718f09b76fc906a6c3848c69";
    sha256 = "08k7p33ixflpxj89rz6cmp5h4a6i1mwa5mi0pkgvnkmbrh6glwax";
    leaveDotGit = true;
  };

  nativeBuildInputs = [ autoconf automake binutils-raw bison flex
    gettext git gperf help2man libtool ncurses texinfo which
    wget ];

  patches =  [ ./gperf-fix.patch ];

  preConfigure = "./bootstrap";

  meta = with lib; {
    description = "A versatile (cross) toolchain generator, with Xtensa support";
    homepage = https://github.com/espressif/crosstool-NG;
    license = licenses.gpl2;
    maintainers = [ maintainers.dhess-pers ];
  };
}
