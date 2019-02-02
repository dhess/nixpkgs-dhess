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
      ffmpeg
      fm-assistant
      mediainfo
      pinentry_mac
      qrencode
      wireguard-tools
      youtube-dl
    ];
    meta.platforms = lib.platforms.darwin;
  };
}
