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
      atomicparsley
      cocoapods
      ffmpeg
      fm-assistant
      lftp
      pinentry_mac
      qrencode
      terminal-notifier
      wireguard-tools
      youtube-dl
    ];
    meta.platforms = lib.platforms.darwin;
  };
}
