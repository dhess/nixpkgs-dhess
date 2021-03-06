# Things that I want in my path in all shells.

self: super:

let

  inherit (super) buildEnv;
  inherit (self) lib;

in
{

  shell-env = buildEnv {
    name = "shell-env";
    paths = with self; [
      coreutils
      direnv
      gitAndTools.git-crypt
      gitAndTools.git-extras
      gnumake
      gnupg
      gnused
      dhess-ssh-keygen
      htop
      lftp
      mosh
      pwgen
      ripgrep
      speedtest-cli
      unbound-block-hosts
      unrar
      wget
      xz
    ];
    meta.platforms = lib.platforms.all;
  };

}
