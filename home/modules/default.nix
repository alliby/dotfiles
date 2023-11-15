{ pkgs, inputs, ... }:
let
  waldl = pkgs.callPackage ./waldl {};
  kabegami = pkgs.callPackage ./kabegami { inputs = inputs; };
  iso2opl = pkgs.callPackage ./iso2opl.nix {};
in
{
  home.packages = [
    kabegami
    waldl
    iso2opl
  ];
}
