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
      awscli
      aws_shell
      gitAndTools.git-crypt
      gitAndTools.git-extras
      gnumake
      gnupg
      gnused
      haskellPackages.dhess-ssh-keygen
      #haskellPackages.hpack-convert
      htop
      mediainfo
      mosh
      pwgen
      ripgrep
      scsh
      speedtest-cli
      tarsnap
      tree
      unbound-block-hosts
      unrar
      wget
      xz
    ];
    meta.platforms = lib.platforms.all;
  };

}
