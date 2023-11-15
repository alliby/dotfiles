{
  inputs,
  pkgs,
  config,
  lib,
  self,
  ...
}: {
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "cargo";
  home.homeDirectory = "/home/cargo";

  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  nixpkgs = {
    config = {
      allowUnfree = false;
      allowBroken = true;
      android_sdk.accept_license = true;
      allowUnfreePredicate = pkg:
        builtins.elem (lib.getName pkg) [
          "steam-run"
          "steam"
          "steam-original"
          "nvidia-x11"
          "nvidia-settings"
          "unrar"
          "discord"
          "android-studio-stable"
          "android-sdk-cmdline-tools"
          "android-sdk-tools"
          "blender"
          "cudatoolkit"
        ];
    };
  };

  imports = [
    ./configurations
    ./modules
    ./packages.nix
    ./overlays.nix
  ];
}
