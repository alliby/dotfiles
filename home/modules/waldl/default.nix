{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "waldl";

  src = ./.;

  nativeBuildInputs = [pkgs.makeWrapper];
  propagatedBuildInputs = [pkgs.jq pkgs.libnotify];

  installPhase = ''
    mkdir -p $out/bin
    install -Dm755 $src/waldl $out/bin/waldl
    wrapProgram "$out/bin/waldl" \
      --prefix PATH : "${pkgs.jq}/bin" \
      --prefix PATH : "${pkgs.libnotify}/bin"
  '';
}
