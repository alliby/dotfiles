{ inputs,  ... }:
let
  targets = [
    "x86_64-pc-windows-msvc"
    "x86_64-pc-windows-gnu"
    "armv7-linux-androideabi"
    "i686-linux-android"
    "aarch64-linux-android"
    "x86_64-linux-android"
    "wasm32-unknown-unknown"
  ]; 
  rust-overlay = (final: prev: {
    rust-stable = prev.rust-bin.stable.latest.default.override {
      extensions = [ "clippy" ];
      targets = targets;
    };
    rust-nightly = prev.rust-bin.nightly.latest.default.override {
      extensions = [ "clippy" ];
      targets = targets;
    };
  });

  ffmpeg-overlay = (final: prev: {
    ffmpeg_5-full = (prev.ffmpeg_5-full.overrideDerivation (old: { NIX_CFLAGS_COMPILE = "-O3 -march=native -s"; }))
      .override {
        withCaca = false;
        buildFfplay = false;
        buildQtFaststart = false;
      };
  });

  mpv-overlay = (final: prev: {
    mpv = prev.wrapMpv (
      (prev.mpv-unwrapped.overrideDerivation (old: { NIX_CFLAGS_COMPILE = "-O3 -march=native -s"; })
    ).override {
      waylandSupport = false;
      sdl2Support = false;
      sixelSupport = false;
      pipewireSupport = false;
      javascriptSupport = false;
      cacaSupport = false;
      ffmpeg_5 = prev.ffmpeg_5-full;
    }) {};
  });
in
{
  nixpkgs.overlays = [
    ffmpeg-overlay
    mpv-overlay
    inputs.rust-overlay.overlays.default
    inputs.mozilla.overlays.firefox
    rust-overlay
  ];
}
