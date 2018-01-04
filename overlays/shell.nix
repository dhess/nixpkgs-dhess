# Things that I want in my path in all shells.

self: super:

let

  inherit (super) buildEnv;

in
{
  shell-env = buildEnv {

    name = "shell-env";
    paths = with self; [

      ansible
      atomicparsley
      av-on
      awscli
      aws_shell
      ffmpeg
      gitAndTools.git-crypt
      gitAndTools.git-extras
      gnupg
      gnused
      haskellPackages821.dhess-ssh-keygen
      haskellPackages821.fm-assistant
      haskellPackages802.hpack-convert
      nox
      pinentry_mac
      lftp
      mediainfo
      nix-binary-cache-update
      nix-build-remote
      nix-index
      nix-repl
      pwgen
      scsh
      speedtest-cli
      sync-fr-xfer
      tarsnap
      terminal-notifier
      tree
      unbound-block-hosts
      unrar
      wake-leibniz
      wget
      texlive.combined.scheme-medium
      xz
      youtube-dl

      # *2nix
      cabal2nix
      pypi2nix

    ];

  };
}
