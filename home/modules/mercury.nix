{ pkgs ? import <nixpkgs> {}, ...}:

pkgs.stdenv.mkDerivation rec {
  pname = "mercury-browser";
  version = "115.4.0";

  src = pkgs.fetchurl {
    url = "https://github.com/Alex313031/Mercury/releases/download/v.${version}/mercury-browser_${version}_amd64.deb";
    hash = "sha256-78b2QEgf312TDBIy4lXzYUBtTfdNui3VJBbyDfXqOtc=";
  };

  nativeBuildInputs = with pkgs; [
    autoPatchelfHook
    dpkg
    wrapGAppsHook
  ];

  buildInputs = with pkgs; [
    stdenv.cc.cc.lib
    alsa-lib
    browserpass
    glib
    glibc
    libnotify
    tridactyl-native
    udev
    uget-integrator
    vulkan-loader
    xdg-utils
    xorg.libxcb
    xorg.libX11
    xorg.libXcursor
    xorg.libXcomposite
    xorg.libXdamage
    xorg.libXext
    xorg.libXfixes
    xorg.libXi
    xorg.libXrandr
    xorg.libXrender
    xorg.libXtst
    xorg.libXxf86vm
  ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out
    cp -r usr/* $out

    substituteInPlace $out/share/applications/mercury-browser.desktop \
      --replace StartupWMClass=mercury StartupWMClass=mercury-default \
    addAutoPatchelfSearchPath $out/lib/mercury
    substituteInPlace $out/bin/mercury-browser \
      --replace 'export LD_LIBRARY_PATH' "export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:${ pkgs.lib.makeLibraryPath buildInputs }:$out/lib/mercury" \
      --replace /usr $out

    runHook postInstall
  '';

  meta = with pkgs.lib; {
    description = "Compiler-optimized private Firefox fork";
    homepage = "https://thorium.rocks/mercury";
    sourceProvenance = with sourceTypes; [ binaryNativeCode ];
    license = licenses.mit;
    platforms = [ "x86_64-linux" ];
    mainProgram = "mercury-browser";
  };
}
