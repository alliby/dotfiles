{ inputs, ... }:
{
  imports = [
    inputs.hyprland.homeManagerModules.default
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    extraConfig = '';
      monitor=eDP-1,1920x1080@60,0x0,1.3
      $mod = SUPER

      env = _JAVA_AWT_WM_NONREPARENTING,1
      env = QT_WAYLAND_DISABLE_WINDOWDECORATION,1

      # use this instead of hidpi patches
      xwayland {
        force_zero_scaling = true
      }

      misc {
        # disable auto polling for config file changes
        disable_autoreload = true

        disable_hyprland_logo = true
        disable_splash_rendering = true

        # disable dragging animation
        animate_mouse_windowdragging = false

        # enable variable refresh rate (effective depending on hardware)
        vrr = 1

        # groupbar
        groupbar_titles_font_size = 16
        groupbar_gradients = false
      }

      # touchpad gestures
      gestures {
        workspace_swipe = true
        workspace_swipe_forever = true
      }

      input {
        kb_layout = us, ara

        accel_profile = flat
      }

      decoration {
        blur {
          enabled = false
        }
        drop_shadow = false
      }

      animations {
        enabled = false
      }

      dwindle {
        # keep floating dimentions while tiling
        pseudotile = true
        preserve_split = true
      }

      # telegram media viewer
      windowrulev2 = float, title:^(Media viewer)$

      # make Firefox PiP window floating and sticky
      windowrulev2 = float, title:^(Picture-in-Picture)$
      windowrulev2 = pin, title:^(Picture-in-Picture)$

      # throw sharing indicators away
      windowrulev2 = workspace special silent, title:^(Firefox — Sharing Indicator)$
      windowrulev2 = workspace special silent, title:^(.*is sharing (your screen|a window)\.)$

      # start spotify tiled in ws9
      windowrulev2 = tile, title:^(Spotify)$
      windowrulev2 = workspace 9 silent, title:^(Spotify)$

      # start Discord/WebCord in ws2
      windowrulev2 = workspace 2, title:^(.*(Disc|WebC)ord.*)$

      # idle inhibit while watching videos
      windowrulev2 = idleinhibit focus, class:^(mpv|.+exe)$
      windowrulev2 = idleinhibit focus, class:^(firefox)$, title:^(.*YouTube.*)$
      windowrulev2 = idleinhibit fullscreen, class:^(firefox)$

      windowrulev2 = dimaround, class:^(gcr-prompter)$

      # fix xwayland apps
      windowrulev2 = rounding 0, xwayland:1, floating:1
      windowrulev2 = center, class:^(.*jetbrains.*)$, title:^(Confirm Exit|Open Project|win424|win201|splash)$
      windowrulev2 = size 640 400, class:^(.*jetbrains.*)$, title:^(splash)$

      $layers = ^(eww-.+|bar|system-menu|anyrun|gtk-layer-shell)$
      layerrule = blur, $layers
      layerrule = ignorealpha 0, $layers
      layerrule = ignorealpha 0.5, ^(eww-(music|calendar)|system-menu|anyrun)$
      layerrule = xray 1, ^(bar|gtk-layer-shell)$

      # mouse movements
      bindm = ALT, mouse:272, movewindow
      bindm = $mod, mouse:272, resizewindow

      # compositor commands
      bind = $mod SHIFT, Q, exec, pkill Hyprland
      bind = $mod, W, killactive,
      bind = $mod, F, fullscreen,
      bind = $mod, G, togglegroup,
      bind = $mod SHIFT, N, changegroupactive, f
      bind = $mod SHIFT, P, changegroupactive, b
      bind = $mod, R, togglesplit,
      bind = $mod, T, togglefloating,
      bind = $mod, P, pseudo,
      bind = $mod ALT, ,resizeactive,
      # toggle "monocle" (no_gaps_when_only)
      $kw = dwindle:no_gaps_when_only
      bind = $mod, M, exec, hyprctl keyword $kw $(($(hyprctl getoption $kw -j | jaq -r '.int') ^ 1))

      # utility
      # terminal
      bind = $mod, Return, exec, alacritty
      # browser
      bind = $mod, b, exec, firefox

      # move focus
      bind = $mod, l, movefocus, l
      bind = $mod, h, movefocus, r
      bind = $mod, j, movefocus, u
      bind = $mod, k, movefocus, d

      # window resize
      bind = $mod, S, submap, resize

      submap = resize
      binde = , right, resizeactive, 10 0
      binde = , left, resizeactive, -10 0
      binde = , up, resizeactive, 0 -10
      binde = , down, resizeactive, 0 10
      bind = , escape, submap, reset
      submap = reset

      # media controls
      bindl = , XF86AudioPlay, exec, playerctl play-pause
      bindl = , XF86AudioPrev, exec, playerctl previous
      bindl = , XF86AudioNext, exec, playerctl next

      # volume
      bindle = , XF86AudioRaiseVolume, exec, wpctl set-volume -l "1.0" @DEFAULT_AUDIO_SINK@ 6%+
      bindle = , XF86AudioLowerVolume, exec, wpctl set-volume -l "1.0" @DEFAULT_AUDIO_SINK@ 6%-
      bindl = , XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
      bindl = , XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle

      # workspaces
      # binds mod + [shift +] {1..10} to [move to] ws {1..10}
      ${builtins.concatStringsSep "\n" (builtins.genList (
          x: let
            ws = let
              c = (x + 1) / 10;
            in
              builtins.toString (x + 1 - (c * 10));
          in ''
            bind = $mod, ${ws}, workspace, ${toString (x + 1)}
            bind = $mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}
          ''
        )
        10)}

      # special workspace
      bind = $mod, grave, togglespecialworkspace, eDP-1

      # cycle workspaces
      bind = $mod, bracketleft, workspace, m-1
      bind = $mod, bracketright, workspace, m+1

      # cycle monitors
      bind = $mod SHIFT, bracketleft, focusmonitor, l
      bind = $mod SHIFT, bracketright, focusmonitor, r
    '';
  };
}