{ pkgs, ... }:
{
  home.packages = [ pkgs.pnmixer ];
  xsession.windowManager.bspwm.enable = true;
  xsession.windowManager.bspwm.alwaysResetDesktops = true;
  xsession.windowManager.bspwm.monitors = { "eDP-1" = [ "1" "2" "3" "4" "5" ]; };
  xsession.windowManager.bspwm.settings = {
    borderless_monocle = "on";
    gapless_monocle = "on";
    border_width = 2.2;
    split_ratio = 0.5;
    window_gap = 5;
    active_border_color = "#f9e2af";
    pointer_action1 = "move";
    pointer_action2 = "resize_side";
    pointer_action3 = "resize_corner";
  };
  xsession.windowManager.bspwm.startupPrograms = [ 
    "xsetroot -cursor_name arrow"
    "pkill pnmixer > /dev/null || pnmixer"
    "polybar"
    "kabegami ~/.local/share/wallhaven/"
  ];
  xsession.windowManager.bspwm.rules = {
    "Zathura" = {
      state = "tiled";
    };
  };
}
