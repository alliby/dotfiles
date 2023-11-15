{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  packages.${system} = {
    catppuccin-folders = pkgs.callPackage ./pkgs/catppuccin-folders.nix {};
    catppuccin-gtk = pkgs.callPackage ./pkgs/catppuccin-gtk.nix {};
    catppuccin-cursors = pkgs.callPackage ./pkgs/catppuccin-cursors.nix {};
  };
}
