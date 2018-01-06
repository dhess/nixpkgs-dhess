# Things that I want in my path in all shells.

self: super:

let

  inherit (super) lib buildEnv;

in
{
  shell-env = buildEnv {
    name = "shell-env";
    paths = with self; [
      ansible
      atomicparsley
      awscli
      aws_shell
      ffmpeg
      gitAndTools.git-crypt
      gitAndTools.git-extras
      gnupg
      gnused
      haskellPackages.dhess-ssh-keygen
      haskellPackages.fm-assistant
      haskellPackages.hpack-convert
      nox
      pinentry_mac
      lftp
      mediainfo
      nix-index
      nix-repl
      pwgen
      scsh
      speedtest-cli
      tarsnap
      terminal-notifier
      tree
      unbound-block-hosts
      unrar
      wget
      texlive.combined.scheme-medium
      xz
      youtube-dl

      # *2nix
      cabal2nix
      pypi2nix
    ];
    meta.platforms = lib.platforms.darwin;
  };
}
