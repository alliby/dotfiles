{ ... }:
{
  programs.mpv.enable = true;
  programs.mpv.bindings = {
    UP = "add volume 2";
    DOWN = "add volume -2";
    "Alt+0" = "set window-scale 0.5";
  };

  programs.mpv.config = {
    hwdec = "auto";
    vo = "gpu";
    save-position-on-quit = "yes";
  };
}
