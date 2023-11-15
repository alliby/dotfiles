{ pkgs, ... }:

{
  services.polybar.enable = true;
  services.polybar.package = pkgs.polybar.override {
    i3Support = true;
    alsaSupport = true;
  };
  services.polybar.script = "polybar &";
  home.file.".config/polybar" = {
    recursive = true;
    source = ./config;
  };
}
