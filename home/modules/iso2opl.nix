{ stdenv, fetchFromGitHub, ...}:
stdenv.mkDerivation {
  name = "iso2opl";
  src = fetchFromGitHub {
    "owner" = "arcadenea";
    "repo" = "iso2opl";
    "rev" = "e98ad288dd057152c2ece1bd1bac70dd701192dd";
    "sha256" = "6gN00pstnlo92wIF/oH8dIQEIDJNu8IJXvWIvoJW3nY=";
  };
  installPhase = ''
      mkdir -p "$out/bin"
      cp iso2opl $out/bin
      chmod 0755 "$out/bin/iso2opl"
  '';
}
