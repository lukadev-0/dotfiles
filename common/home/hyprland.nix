{ pkgs, config, lib, inputs, ... }:
let
  terminal = "warp-terminal";
  fileManager = "nautilus";
  menu = "wofi --show drun";

  mainMod = "SUPER";
in
{
  home.packages = with pkgs; [
    hyprpicker
    grimblast
    grim
    slurp
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = ",preferred,auto,auto";

      exec-once = [
        "ags"
      ];

      env = [
        "XCURSOR_SIZE,${toString config.home.pointerCursor.size}"
        "HYPRCURSOR_SIZE,${toString config.home.pointerCursor.size}"
      ];

      general = {
        gaps_in = 4;
        gaps_out = 12;

        "col.inactive_border" = "$surface1";
        "col.active_border" = "$accent";
      };

      decoration = {
        rounding = 8;

        shadow_range = 28;
        shadow_render_power = 4;
        shadow_offset = "0 2";
        "col.shadow" = "rgba(00000030)";

        blur = {
          passes = 2;
          size = 16;
        };
      };

      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = 0;
      };

      bind = [
        "${mainMod}, Q, exec, ${terminal}"
        "${mainMod}, C, killactive,"
        "${mainMod}, M, exit,"
        "${mainMod}, E, exec, ${fileManager}"
        "${mainMod}, V, togglefloating,"
        "${mainMod}, R, exec, ${menu}"
        "${mainMod}, P, pseudo,"
        "${mainMod}, J, togglesplit,"

        "${mainMod}, left, movefocus, l"
        "${mainMod}, right, movefocus, r"
        "${mainMod}, up, movefocus, u"
        "${mainMod}, down, movefocus, d"

        "${mainMod}, 1, workspace, 1"
        "${mainMod}, 2, workspace, 2"
        "${mainMod}, 3, workspace, 3"
        "${mainMod}, 4, workspace, 4"
        "${mainMod}, 5, workspace, 5"
        "${mainMod}, 6, workspace, 6"
        "${mainMod}, 7, workspace, 7"
        "${mainMod}, 8, workspace, 8"
        "${mainMod}, 9, workspace, 9"
        "${mainMod}, 0, workspace, 10"

        "${mainMod} SHIFT, 1, movetoworkspace, 1"
        "${mainMod} SHIFT, 2, movetoworkspace, 2"
        "${mainMod} SHIFT, 3, movetoworkspace, 3"
        "${mainMod} SHIFT, 4, movetoworkspace, 4"
        "${mainMod} SHIFT, 5, movetoworkspace, 5"
        "${mainMod} SHIFT, 6, movetoworkspace, 6"
        "${mainMod} SHIFT, 7, movetoworkspace, 7"
        "${mainMod} SHIFT, 8, movetoworkspace, 8"
        "${mainMod} SHIFT, 9, movetoworkspace, 9"
        "${mainMod} SHIFT, 0, movetoworkspace, 10"

        "${mainMod}, S, togglespecialworkspace, magic"
        "${mainMod} SHIFT, S, movetoworkspace, special:magic"

        "${mainMod}, mouse_down, workspace, e+1"
        "${mainMod} SHIFT, right, workspace, e+1"
        "${mainMod}, mouse_up, workspace, e-1"
        "${mainMod} SHIFT, left, workspace, e-1"

        ", Print, exec, grimblast --freeze --notify copysave area"
        "${mainMod} SHIFT, P, exec, hyprpicker --autocopy"
        "${mainMod}, Print, exec, grimblast --notify copysave"
      ];

      bindm = [
        "${mainMod}, mouse:272, movewindow"
        "${mainMod}, mouse:273, resizewindow"
      ];

      windowrulev2 = [ "suppressevent maximize, class:.*" ];
    };
  };

  home.activation = {
    restartAgs = lib.hm.dag.entryAnywhere ''
      if [[ -n "''${HYPRLAND_INSTANCE_SIGNATURE:-}" ]]; then
        run ags -q
        run hyprctl dispatch exec ags
      fi
    '';
  };
}
