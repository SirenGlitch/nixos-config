{
  config,
  userSettings,
  pkgs,
  lib,
  ...
}:

{
  programs.kitty.enable = true;

  home.packages = with pkgs; [
    hyprpicker
    grim
    slurp
    wayfreeze
    satty
  ];

  home.file = {
    ".config/hypr/scripts/lock-screen" = {
      executable = true;
      text = ''
        #!/usr/bin/env bash
        # Another day, another ~stolen~ borrowed Omarchy script

        # Lock the screen
        pidof hyprlock || hyprlock &

        # Set keyboard layout to default (first layout)
        hyprctl switchxkblayout all 0 > /dev/null 2>&1
      '';
    };
    ".config/hypr/scripts/launch-or-focus" = {
      executable = true;
      text = ''
        #!/usr/bin/env bash
        # Shamelessly ~stolen~ borrowed from the omarchy config

        if (($# == 0)); then
          echo "Usage: launch-or-focus [window-pattern] [launch-command]"
          exit 1
        fi

        WINDOW_PATTERN="$1"
        LAUNCH_COMMAND="''${2:-"${pkgs.uwsm}/bin/uwsm-app -- $WINDOW_PATTERN"}"
        WINDOW_ADDRESS=$(hyprctl clients -j | jq -r --arg p "$WINDOW_PATTERN" '.[]|select((.class|test("\\b" + $p + "\\b";"i")) or (.title|test("\\b" + $p + "\\b";"i")))|.address' | head -n1)

        if [[ -n $WINDOW_ADDRESS ]]; then
          hyprctl dispatch focuswindow "address:$WINDOW_ADDRESS"
        else
          eval exec setsid $LAUNCH_COMMAND
        fi
      '';
    };
    ".config/hypr/scripts/cmd-screenshot" = {
      executable = true;
      text = ''
        #!/usr/bin/env bash
        # Omarchy screenshot script adapted to work literally anywhere else

        [[ -f ~/.config/user-dirs.dirs ]] && source ~/.config/user-dirs.dirs
        OUTPUT_DIR="''${XDG_PICTURES_DIR:-$HOME/Pictures}/Screenshots"

        if [[ ! -d "$OUTPUT_DIR" ]]; then
          notify-send "Screenshot directory does not exist: $OUTPUT_DIR" -u critical -t 3000
          exit 1
        fi

        pkill slurp && exit 0

        MODE="''${1:-smart}"
        PROCESSING="''${2:-slurp}"

        get_rectangles() {
          local active_workspace=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .activeWorkspace.id')
          hyprctl monitors -j | jq -r --arg ws "$active_workspace" '.[] | select(.activeWorkspace.id == ($ws | tonumber)) | "\(.x),\(.y) \((.width / .scale) | floor)x\((.height / .scale) | floor)"'
          hyprctl clients -j | jq -r --arg ws "$active_workspace" '.[] | select(.workspace.id == ($ws | tonumber)) | "\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"'
        }

        # Select based on mode
        case "$MODE" in
        region)
          wayfreeze &
          PID=$!
          sleep .1
          SELECTION=$(slurp 2>/dev/null)
          kill $PID 2>/dev/null
          ;;
        windows)
          wayfreeze &
          PID=$!
          sleep .1
          SELECTION=$(get_rectangles | slurp -r 2>/dev/null)
          kill $PID 2>/dev/null
          ;;
        fullscreen)
          SELECTION=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | "\(.x),\(.y) \((.width / .scale) | floor)x\((.height / .scale) | floor)"')
          ;;
        smart | *)
          RECTS=$(get_rectangles)
          wayfreeze &
          PID=$!
          sleep .1
          SELECTION=$(echo "$RECTS" | slurp 2>/dev/null)
          kill $PID 2>/dev/null

          # If the selction area is L * W < 20, we'll assume you were trying to select whichever
          # window or output it was inside of to prevent accidental 2px snapshots
          if [[ "$SELECTION" =~ ^([0-9]+),([0-9]+)[[:space:]]([0-9]+)x([0-9]+)$ ]]; then
            if ((''${BASH_REMATCH[3]} * ''${BASH_REMATCH[4]} < 20)); then
              click_x="''${BASH_REMATCH[1]}"
              click_y="''${BASH_REMATCH[2]}"

              while IFS= read -r rect; do
                if [[ "$rect" =~ ^([0-9]+),([0-9]+)[[:space:]]([0-9]+)x([0-9]+) ]]; then
                  rect_x="''${BASH_REMATCH[1]}"
                  rect_y="''${BASH_REMATCH[2]}"
                  rect_width="''${BASH_REMATCH[3]}"
                  rect_height="''${BASH_REMATCH[4]}"

                  if ((click_x >= rect_x && click_x < rect_x + rect_width && click_y >= rect_y && click_y < rect_y + rect_height)); then
                    SELECTION="''${rect_x},''${rect_y} ''${rect_width}x''${rect_height}"
                    break
                  fi
                fi
              done <<<"$RECTS"
            fi
          fi
          ;;
        esac

        [ -z "$SELECTION" ] && exit 0

        if [[ $PROCESSING == "slurp" ]]; then
          grim -g "$SELECTION" - |
            satty --filename - \
              --output-filename "$OUTPUT_DIR/screenshot-$(date +'%Y-%m-%d_%H-%M-%S').png" \
              --early-exit \
              --actions-on-enter save-to-clipboard \
              --save-after-copy \
              --copy-command 'wl-copy'
        else
          grim -g "$SELECTION" - | wl-copy
        fi
      '';
    };
  };

  services = {
    swayosd.enable = true;

    # Move to a seperate config, ../services/blah.nix
    mako = {
      enable = true;
    };

    hypridle = {
      enable = true;
    };

    hyprpaper = {
      enable = true;
    };

    clipse = {
      enable = true;
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;

    systemd.enable = false; # Home-manager x UWSM conflict fix

    # Should roughly follow standard hyprland.conf syntax in here + semicolons and equals signs
    # Use something or other (my own hands?) to port WHITELIGHTNING config to nix
    settings = lib.mkForce {
      "$mainMod" = "SUPER";
      "$terminal" = "${pkgs.kitty}/bin/kitty";
      "$fileManager" = "${pkgs.yazi}/bin/yazi";
      "$menu" = "${pkgs.rofi}/bin/rofi -show drun";
      "$browser" = "${pkgs.firefox}/bin/firefox";
      "$osdclient" =
        "${pkgs.swayosd}/bin/swayosd-client --monitor \"$(hyprctl monitors -j | jq -r '.[] | select(.focused == true).name')\"";

      env = [
        # Force all apps to use Wayland
        "GDK_BACKEND,wayland,x11,*"
        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_STYLE_OVERRIDE,kvantum"
        "SDL_VIDEODRIVER,wayland"
        "MOZ_ENABLE_WAYLAND,1"
        "ELECTRON_OZONE_PLATFORM_HINT,wayland"
        "OZONE_PLATFORM,wayland"
        "XDG_SESSION_TYPE,wayland"

        # Allow better support for screen sharing (Google Meet, Discord, etc)
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XCOMPOSEFILE,~/.XCompose"

        # Style Gum confirm to match terminal theme
        "GUM_CONFIRM_PROMPT_FOREGROUND,6" # Cyan
        "GUM_CONFIRM_SELECTED_FOREGROUND,0" # Black
        "GUM_CONFIRM_SELECTED_BACKGROUND,2" # Green
        "GUM_CONFIRM_UNSELECTED_FOREGROUND,0" # Black
        "GUM_CONFIRM_UNSELECTED_BACKGROUND,8" # Dark grey
      ];

      exec-once = [
        # "${pkgs.uwsm}/bin/uwsm-app -- ${pkgs.hypridle}/bin/hypridle"
        # "${pkgs.uwsm}/bin/uwsm-app -- ${pkgs.hyprpaper}/bin/hyprpaper"
        # "${pkgs.uwsm}/bin/uwsm-app -- ${pkgs.mako}/bin/mako"
        # "${pkgs.uwsm}/bin/uwsm-app -- ${pkgs.swayosd}/bin/swayosd-server"
      ];

      monitor = [
        ",prefered,auto,1.25"
      ];

      xwayland = {
        force_zero_scaling = true;
      };

      bind = [ ];

      bindd = [
        # Close windows
        "$mainMod, W, Close window, killactive,"

        # Control tiling
        "$mainMod, J, Toggle window split, togglesplit, # dwindle"
        "$mainMod, P, Pseudo window, pseudo, # dwindle"
        "$mainMod SHIFT, V, Toggle window floating/tiling, togglefloating,"
        "SHIFT, F11, Force full screen, fullscreen, 0"
        "ALT, F11, Full width, fullscreen, 1"

        # Move focus with $mainMod + arrow keys
        "$mainMod, LEFT, Move focus left, movefocus, l"
        "$mainMod, RIGHT, Move focus right, movefocus, r"
        "$mainMod, UP, Move focus up, movefocus, u"
        "$mainMod, DOWN, Move focus down, movefocus, d"
        "$mainMod, RETURN, Terminal, exec, ${pkgs.uwsm}/bin/uwsm-app -- $terminal --dir=\"~\""
        "$mainMod SHIFT, F, File manager, exec, ${pkgs.uwsm}/bin/uwsm-app -- $terminal -e $fileManager"
        "$mainMod SHIFT, B, Browser, exec, ${pkgs.uwsm}/bin/uwsm-app -- $browser"
        "$mainMod SHIFT ALT, B, Browser (private), exec, ${pkgs.uwsm}/bin/uwsm-app -- $browser --private-window"
        "$mainMod SHIFT, D, Discord, exec, ${pkgs.uwsm}/bin/uwsm-app -- ${pkgs.vesktop}/bin/vesktop"
        "$mainMod SHIFT, M, Music, exec, bash ~/.config/hypr/scripts/launch-or-focus spotify"
        "$mainMod SHIFT, N, Editor, exec, ${pkgs.uwsm}/bin/uwsm-app -- ${pkgs.neovide}/bin/neovide"
        "$mainMod SHIFT, S, Steam, exec, ${pkgs.uwsm}/bin/uwsm-app -- steam"
        "$mainMod SHIFT, T, Activity, exec, $terminal -e ${pkgs.btop}/bin/btop"
        "$mainMod SHIFT, SLASH, Passwords, exec, ${pkgs.uwsm}/bin/uwsm-app -- keepassxc"
        "$mainMod, SPACE, Apps List, exec, $menu"
        # "$mainMod, ESCAPE, Power Menu, exec, wlogout #Actual app tbd"
        "$mainMod, V, Clipboard Manager, exec, ${pkgs.uwsm}/bin/uwsm-app -- $terminal --class clipse -e 'clipse'"
      ]
      ++ (
        # workspaces
        # binds $mainMod + [shift +] {1..9} to [move to] workspace {1..9}
        builtins.concatLists (
          builtins.genList (
            i:
            let
              ws = i + 1;
            in
            [
              "$mainMod, code:1${toString i}, Switch to workspace ${toString ws}, workspace, ${toString ws}"
              "$mainMod SHIFT, code:1${toString i}, Move window to workspace ${toString ws}, movetoworkspace, ${toString ws}"
            ]
          ) 9
        )
      )
      ++ [
        # TAB between workspaces
        "$mainMod, TAB, Next workspace, workspace, e+1"
        "$mainMod SHIFT, TAB, Previous workspace, workspace, e-1"
        "$mainMod CTRL, TAB, Former workspace, workspace, previous"

        # Swap active window with the one next to it with $mainMod + SHIFT + arrow keys
        "$mainMod SHIFT, LEFT, Swap window to the left, swapwindow, l"
        "$mainMod SHIFT, RIGHT, Swap window to the right, swapwindow, r"
        "$mainMod SHIFT, UP, Swap window up, swapwindow, u"
        "$mainMod SHIFT, DOWN, Swap window down, swapwindow, d"

        # Cycle through applications on active workspace
        "ALT, TAB, Cycle to next window, cyclenext"
        "ALT SHIFT, TAB, Cycle to prev window, cyclenext, prev"
        "ALT, TAB, Reveal active window on top, bringactivetotop"
        "ALT SHIFT, TAB, Reveal active window on top, bringactivetotop"

        # Resize active window
        # "$mainMod, code:20, Expand window left, resizeactive, -100 0"    # - key
        # "$mainMod, code:21, Shrink window left, resizeactive, 100 0"     # = key
        # "$mainMod SHIFT, code:20, Shrink window up, resizeactive, 0 -100"
        # "$mainMod SHIFT, code:21, Expand window down, resizeactive, 0 100"

        # Scroll through existing workspaces with $mainMod + scroll
        "$mainMod, MOUSE_DOWN, Scroll active workspace forward, workspace, e+1"
        "$mainMod, MOUSE_UP, Scroll active workspace backward, workspace, e-1"

        ",XF86Calculator, Calculator, exec, ${pkgs.gnome-calculator}/bin/gnome-calculator"

        # Notifications
        "$mainMod, COMMA, Dismiss last notification, exec, ${pkgs.mako}/bin/makoctl dismiss"
        "$mainMod SHIFT, COMMA, Dismiss all notifications, exec, ${pkgs.mako}/bin/makoctl dismiss --all"
        "$mainMod CTRL, COMMA, Toggle silencing notifications, exec, ${pkgs.mako}/bin/makoctl mode -t do-not-disturb && ${pkgs.mako}/bin/makoctl mode | grep -q 'do-not-disturb' && notify-send \"Silenced notifications\" || notify-send \"Enabled notifications\""
        "$mainMod, PERIOD, Invoke notification, exec, ${pkgs.mako}/bin/makoctl invoke"
        "$mainMod SHIFT ALT, COMMA, Invoke last notification, exec, ${pkgs.mako}/bin/makoctl restore"

        # Captures
        ", XF86Tools, Screenshot with editing, exec, bash ~/.config/hypr/scripts/cmd-screenshot"
        "SHIFT, XF86Tools, Screenshot to clipboard, exec, bash ~/.config/hypr/scripts/cmd-screenshot smart clipboard"
        "$mainMod, XF86Tools, Color picker, exec, pkill ${pkgs.hyprpicker}/bin/hyprpicker || ${pkgs.hyprpicker}/bin/hyprpicker -a"
      ];

      binde = [
        "SUPER, equal, exec, hyprctl -q keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor -j | jq '.float * 1.1')"
        "SUPER, minus, exec, hyprctl -q keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor -j | jq '(.float * 0.9) | if . < 1 then 1 else . end')"
      ];

      bindmd = [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        "$mainMod, mouse:272, Move window, movewindow"
        "$mainMod, mouse:273, Resize window, resizewindow"
      ];

      bindeld = [
        ",XF86AudioRaiseVolume, Volume up, exec, $osdclient --output-volume raise"
        ",XF86AudioLowerVolume, Volume down, exec, $osdclient --output-volume lower"
        ",XF86AudioMute, Mute, exec, $osdclient --output-volume mute-toggle"
        ",XF86AudioMicMute, Mute microphone, exec, $osdclient --input-volume mute-toggle"
        ",XF86MonBrightnessUp, Brightness up, exec, $osdclient --brightness raise"
        ",XF86MonBrightnessDown, Brightness down, exec, $osdclient --brightness lower"
        "ALT, XF86AudioRaiseVolume, Volume up precise, exec, $osdclient --output-volume +1"
        "ALT, XF86AudioLowerVolume, Volume down precise, exec, $osdclient --output-volume -1"
        "ALT, XF86MonBrightnessUp, Brightness up precise, exec, $osdclient --brightness +1"
        "ALT, XF86MonBrightnessDown, Brightness down precise, exec, $osdclient --brightness -1"
      ];

      input = {
        kb_layout = "gb";
        follow_mouse = true;

        touchpad = {
          natural_scroll = true;
        };

        numlock_by_default = true;
      };

      # https://wiki.hyprland.org/Configuring/Variables/#misc
      misc = {
        key_press_enables_dpms = true;
        mouse_move_enables_dpms = true;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        focus_on_activate = true;
        anr_missed_pings = 3;
        on_focus_under_fullscreen = 1;
      };

      "$activeBorderColor" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
      "$inactiveBorderColor" = "rgba(595959aa)";

      # https://wiki.hyprland.org/Configuring/Variables/#general
      general = {
        gaps_in = 5;
        gaps_out = 20;

        border_size = 2;

        # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
        "col.active_border" = "$activeBorderColor";
        "col.inactive_border" = "$inactiveBorderColor";

        # Set to true enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false;

        # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false;

        layout = "dwindle";
      };

      # https://wiki.hyprland.org/Configuring/Variables/#decoration
      decoration = {
        inactive_opacity = 0.75;
        active_opacity = 0.9;
        rounding = 10;
        rounding_power = 2;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };

        # https://wiki.hyprland.org/Configuring/Variables/#blur
        blur = {
          enabled = true;
          size = 8;
          passes = 2;
          special = true;
          brightness = 0.60;
          contrast = 0.75;
        };
      };

      # https://wiki.hypr.land/Configuring/Variables/#group
      group = {
        "col.border_active" = "$activeBorderColor";
        "col.border_inactive" = "$inactiveBorderColor";
        "col.border_locked_active" = -1;
        "col.border_locked_inactive" = -1;

        groupbar = {
          font_size = 12;
          font_family = "monospace";
          font_weight_active = "ultraheavy";
          font_weight_inactive = "normal";

          indicator_height = 0;
          indicator_gap = 5;
          height = 22;
          gaps_in = 5;
          gaps_out = 0;

          text_color = "rgb(ffffff)";
          text_color_inactive = "rgba(ffffff90)";
          "col.active" = "rgba(00000040)";
          "col.inactive" = "rgba(00000020)";

          gradients = true;
          gradient_rounding = 0;
          gradient_round_only_edges = false;
        };
      };

      # https://wiki.hyprland.org/Configuring/Variables/#animations
      animations = {
        enabled = true;

        # Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
        bezier = [
          "easeOutQuint,     0.23,  1,     0.32,         1"
          "easeInOutCubic,   0.65,  0.05,  0.36,         1"
          "linear,           0,     0,     1,            1"
          "almostLinear,     0.5,   0.5,   0.75,         1.0"
          "quick,            0.15,  0,     0.1,          1"
          "overshot,         0.05,  0.9,   0.1,          1.1"
        ];

        animation = [
          "global,        1,     10,    default"
          "border,        1,     5.39,  easeOutQuint"
          "windows,       1,     4.79,  easeOutQuint"
          # "windowsIn,     1,     4.1,   easeOutQuint, popin 87%"
          # "windowsOut,    1,     1.49,  linear,       popin 87%"
          "fadeIn,        1,     1.73,  almostLinear"
          "fadeOut,       1,     1.46,  almostLinear"
          "fade,          1,     3.03,  quick"
          "layers,        1,     3.81,  easeOutQuint"
          "layersIn,      1,     4,     easeOutQuint, fade"
          "layersOut,     1,     1.5,   linear,       fade"
          "fadeLayersIn,  1,     1.79,  almostLinear"
          "fadeLayersOut, 1,     1.39,  almostLinear"
          "workspaces,    1,     3.5,   overshot,     slide"
          # "workspacesIn,  1,     1.21,  almostLinear, fade"
          # "workspacesOut, 1,     1.94,  almostLinear, fade"
          "windows,       1,     3,     overshot,     popin 60%"
          "zoomFactor,    1,     7,     quick"
        ];
      };

      # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
      dwindle = {
        pseudotile = true; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true; # You probably want this
        force_split = 2; # Always split on the right
      };

      # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
      master = {
        new_status = "master";
      };

      # https://wiki.hypr.land/Configuring/Variables/#cursor
      cursor = {
        hide_on_key_press = true;
      };

      windowrule = [
        # Browser types
        "tag +chromium-based-browser, match:class ((google-)?[cC]hrom(e|ium)|[bB]rave-browser|[mM]icrosoft-edge|Vivaldi-stable|helium)"
        "tag +firefox-based-browser, match:class ([fF]irefox|zen|librewolf)"

        # Force chromium-based browsers into a tile to deal with --app bug
        "tile on, opacity 1 0.97, match:tag chromium-based-browser"

        # Only a subtle opacity change, but not for video sites
        "opacity 1 0.97, match:tag firefox-based-browser"

        # Some video sites should never have opacity applied to them
        "opacity 1.0 1.0, match:initial_title ((?i)(?:[a-z0-9-]+\\.)*youtube\\.com_/|app\\.zoom\\.us_/wc/home)"

        # Picture-in-picture overlays
        "tag +pip, match:title (Picture.?in.?[Pp]icture)"
        "float on, pin on, size 600 338, keep_aspect_ratio on, border_size 0, opacity 1 1, move ((monitor_w*1)-window_w-40) ((monitor_h*0.04)), match:tag pip"

        "fullscreen on, opacity 1 1, idle_inhibit fullscreen, match:class com.libretro.RetroArch"

        # Float Steam
        "float on, opacity 1 1, idle_inhibit fullscreen, match:class steam"
        "center on, size 1100 700, match:class steam, match:title Steam"
        "size 460 800, match:class steam, match:title Friends List"

        # Floating windows
        "float on, center on, size 875 600, match:tag floating-window"

        "tag +floating-window, match:class (xdg-desktop-portal-gtk|sublime_text|DesktopEditors|org.gnome.Nautilus), match:title ^(Open.*Files?|Open [F|f]older.*|Save.*Files?|Save.*As|Save|All Files|.*wants to [open|save].*|[C|c]hoose.*)"
        "float on, match:class org.gnome.Calculator"

        # No transparency on media windows
        "opacity 1 1, match:class ^(zoom|vlc|mpv|org.kde.kdenlive|com.obsproject.Studio|com.github.PintaProject.Pinta|imv|org.gnome.NautilusPreviewer)$"

        # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
        "suppress_event maximize, match:class .*"

        # Fix some dragging issues with XWayland
        "no_focus on, match:class ^$, match:title ^$, match:xwayland 1, match:float 1, match:fullscreen 0, match:pin 0"

        # Clipse
        "float on, match:class clipse"
        "size 622 652, match:class clipse"
      ];

      cursor = {
        zoom_disable_aa = true;
      };
    };
  };
}
