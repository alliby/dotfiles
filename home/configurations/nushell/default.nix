{ pkgs, ... }:
let
  pkgsUnstable = import <nixpkgs-unstable> {};
in
{
  imports = [ ./aliases.nix ];
  programs.nushell.enable = true;
  programs.nushell.package = pkgsUnstable.nushell;
  programs.nushell.configFile.source = ./config.nu;
  programs.nushell.envFile.source = ./env.nu;
}
