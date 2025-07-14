{ pkgs, ... }:

{
  home.sessionVariables.NIXOS_OZONE_WL = "1";

  services.hyprpolkitagent.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    settings = {
      "$terminal" = "${pkgs.ghostty}/bin/ghostty";
      "$browser" = "${pkgs.firefox}/bin/firefox";
      "$menu" = "${pkgs.wofi}/bin/wofi --show drun";
      "$fileManager" = "${pkgs.nautilus}/bin/nautilus";
      "$mod" = "SUPER";

      exec-once = [
        "luka-shell"
      ];

      general = {
        "col.inactive_border" = "rgba(108,112,134,0.5)";
        "col.active_border" = "rgb(137,180,250)";
        gaps_out = "20,20,20,5";
      };

      decoration = {
        rounding = 8;
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        focus_on_activate = true;
      };

      animation = [
        "workspaces, 0"
        "workspacesIn, 1, 3, default, slidefadevert 3%"
        "windowsIn, 1, 3, default, popin 80%"
        "windowsOut, 0"
        "windowsMove, 1, 2, default, popin 80%"
        "fade, 1, 2, default"
      ];

      bind =
        [
          "$mod, Q, exec, $terminal"
          "$mod, C, killactive,"
          "$mod, M, exit,"
          "$mod, E, exec, $fileManager"
          "$mod, V, togglefloating,"
          "$mod, R, exec, $menu"
          "$mod, P, pseudo,"
          "$mod, J, togglesplit,"

          "$mod, left, movefocus, l"
          "$mod, right, movefocus, r"
          "$mod, up, movefocus, u"
          "$mod, down, movefocus, d"
        ]
        ++ (builtins.concatLists (
          builtins.genList (
            i:
            let
              ws = i + 1;
            in
            [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          ) 9
        ));

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };
  };
}
