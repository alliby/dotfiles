{ pkgs, ... }:
let
  pkgsUnstable = import <nixpkgs-unstable> {};
in {
  programs.eww.enable = true;
  programs.eww.package = pkgsUnstable.eww;
  programs.eww.configDir = ./eww;
}
