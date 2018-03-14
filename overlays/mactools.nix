# These things I generally only install on macOS.

self: super:

let

  inherit (super) buildEnv;
  inherit (self) lib;

in
{
  mactools-env = buildEnv {
    name = "mactools-env";
    paths = with self; [
      ansible
      atomicparsley
      ffmpeg
      fm-assistant
      pinentry_mac
      lftp
      terminal-notifier
      youtube-dl
    ];
    meta.platforms = lib.platforms.darwin;
  };
}
