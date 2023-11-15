{ inputs, pkgs ? import <nixpkgs> {}, ... }: let
  naersk = pkgs.callPackage inputs.naersk {
    cargo = pkgs.rust-stable;
    rustc = pkgs.rust-stable;
  };
in naersk.buildPackage  {
  pname = "kabegami";
  version = "0.2.2";

  src = pkgs.fetchFromGitHub {
    "owner" = "alliby";
    "repo" = "kabegami";
    "rev" = "3a7a6f80e4cbf6cce53f5bc43c01de00bf529693";
    "sha256" = "JncISm4PBkafIDLS75xANqYdx30GXUA2tbi0IophC98=";
  };
  
  cargoSha256 = "sha256-qSSMi3UV/CXLGXtFuUiFURXYa/viaSI9R0b5zQcPTgk=";

  RUSTFLAGS = "-C target-cpu=native";

}

