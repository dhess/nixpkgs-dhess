# TeX/LaTeX/etc.

self: super:

let

  inherit (super) buildEnv;
  inherit (self) lib;

in
{

  tex-env = buildEnv {
    name = "tex-env";
    paths = with self; [
      texlive.combined.scheme-full
    ];
    meta.platforms = lib.platforms.all;
  };

}
