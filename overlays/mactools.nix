# These things I generally only install on macOS.

self: super:

let

  inherit (super) lib buildEnv;

in
{
  mactools-env = buildEnv {
    name = "mactools-env";
    paths = with super; [
      ansible
      atomicparsley
      ffmpeg
      #haskellPackages.fm-assistant
      pinentry_mac
      lftp
      terminal-notifier
      youtube-dl
    ];
    meta.platforms = lib.platforms.darwin;
  };
}
