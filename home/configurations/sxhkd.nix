{ ... }:

{
  services.sxhkd.enable = true;

  services.sxhkd.keybindings = {
    # wm independent hotkeys

    # Hide/Show polybar
    "super + space" = "bspc config top_padding 0 && polybar-msg cmd toggle";

    # run clipboard menu
    "super + c" = "alacritty -e clipmenu";

    # change Wallpaper
    "super + a" = "kabegami ~/.local/share/wallhaven";
    
    # launch firefox
    "super + b" = "firefox";

    # launch rofi launcher
    "super + r" = "~/.config/rofi/launcher.sh";

    # launch file browser
    "super + e" = "pcmanfm";

    # powemenu
    "super + shift + s" = "~/.config/rofi/powermenu.sh";
    
    # terminal emulator
    "super + Return" = "alacritty";

    # make sxhkd reload its configuration files:
    "super + Escape" = "pkill -USR1 -x sxhkd";

    # bspwm hotkeys

    # quit/restart bspwm
    "super + shift + {q,r}" = "bspc {quit,wm -r}";

    # close and kill
    "super + {_,shift + }w" = "bspc node -{c,k}";

    # alternate between the tiled and monocle layout
    "super + m" = "bspc desktop -l next";

    # send the newest marked node to the newest preselected node
    "super + y" = "bspc node newest.marked.local -n newest.!automatic.local";

    # swap the current node and the biggest window
    "super + g" = "bspc node -s biggest.window";

    # state/flags

    # set the window state
    "super + {t,shift + t,s,f}" = "bspc node -t {tiled,pseudo_tiled,floating,fullscreen}";

    # set the node flags
    "super + ctrl + {m,x,y,z}" = "bspc node -g {marked,locked,sticky,private}";

    # focus/swap

    # focus the node in the given direction
    "super + {_,shift + }{h,j,k,l}" = "bspc node -{f,s} {west,south,north,east}";

    # focus the next/previous window in the current desktop
    "super + {comma, semicolon}" = "bspc node -f {next,prev}.local.!hidden.window";

    # focus the next/previous desktop in the current monitor
    "super + bracket{left,right}" = "bspc desktop -f {prev,next}.local";

    # focus the last node/desktop
    "super + {grave,Tab}" = "bspc {node,desktop} -f last";

    # focus the older or newer node in the focus history
    "super + {o,i}" = "bspc wm -h off; bspc node {older,newer} -f; bspc wm -h on";

    # focus or send to the given desktop
    "super + {_,shift + }{1-9,0}" = "bspc {desktop -f,node -d} '^{1-9,10}'";

    # preselect

    # preselect the direction
    "super + ctrl + {h,j,k,l}" = "bspc node -p {west,south,north,east}";

    # preselect the ratio
    "super + ctrl + {1-9}" = "bspc node -o 0.{1-9}";

    # cancel the preselection for the focused node
    "super + ctrl + space" = "bspc node -p cancel";

    # cancel the preselection for the focused desktop
    "super + ctrl + shift + space" = "bspc query -N -d | xargs -I id -n 1 bspc node id -p cancel";

    # move/resize

    # expand a window by moving one of its side outward
    "super + alt + {Left,Down,Up,Right}" = "bspc node -z {left -20 0,bottom 0 20,top 0 -20,right 20 0}";

    # contract a window by moving one of its side inward
    "super + shift + {Left,Down,Up,Right}" = "bspc node -z {right -20 0,top 0 20,bottom 0 -20,left 20 0}";

    # move a floating window
    "super + {Left,Down,Up,Right}" = "bspc node -v {-20 0,0 20,0 -20,20 0}";

    # Make split ratios equal
    "super + equal" = "bspc node @/ --equalize";

    # Manage brightness
    "XF86MonBrightness{Up,Down}" = "brightnessctl set {+5%, 5%-}";

    # Volume control
    # "XF86Audio{RaiseVolume,LowerVolume}" = "wpctl set-volume @DEFAULT_AUDIO_SINK@ {3%+, 3%-}";
    # "XF86AudioMute" = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
    "XF86Audio{RaiseVolume,LowerVolume,Mute}" = "amixer sset Master {3%+, 3%-, toggle}";

    # Microphone conrol
    "XF86AudioMicMute" = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";

  };
}
