{
  lib,
  pkgs,
  config,
  ...
}:
let
  inherit (config) colors;
  inherit (lib)
    concatMapAttrsStringSep
    mapAttrs'
    nameValuePair
    replaceString
    ;

  gtkNamedColors = {
    destructive_bg_color = colors.red;
    destructive_fg_color = colors.crust;
    success_bg_color = colors.green;
    success_fg_color = colors.crust;
    warning_bg_color = colors.yellow;
    warning_fg_color = colors.crust;
    error_bg_color = colors.red;
    error_fg_color = colors.crust;
    accent_bg_color = colors.accent;
    accent_fg_color = colors.crust;
    window_bg_color = colors.mantle;
    window_fg_color = colors.text;
    view_bg_color = colors.mantle;
    view_fg_color = colors.text;
    headerbar_bg_color = colors.mantle;
    headerbar_fg_color = colors.text;
    headerbar_backdrop_color = colors.crust;
    popover_bg_color = colors.surface0;
    popover_fg_color = colors.text;
    dialog_bg_color = colors.base;
    dialog_fg_color = colors.text;
    card_bg_color = colors.base;
    card_fg_color = colors.text;
    sidebar_bg_color = colors.base;
    sidebar_fg_color = colors.text;
    sidebar_backdrop_color = colors.mantle;
  };

  cssVars =
    mapAttrs' (name: _: nameValuePair (replaceString "_" "-" name) "@${name}") gtkNamedColors
    // {
      accent-blue = colors.blue;
      accent-teal = colors.teal;
      accent-green = colors.green;
      accent-yellow = colors.yellow;
      accent-orange = colors.orange;
      accent-red = colors.red;
      accent-pink = colors.pink;
      accent-purple = colors.purple;
      accent-slate = colors.overlay1;
      overview-bg-color = colors.crust;
    };

  extraCss =
    concatMapAttrsStringSep "" (name: color: "@define-color ${name} ${color};\n") gtkNamedColors
    + ''
      window.message.dialog.csd:not(.solid-csd),
      window.messagedialog.csd:not(.solid-csd) {
        border-radius: 0;
      }
      toast {
        background: ${colors.surface1};
      }
    '';
in
{
  home = { config, ... }: {
    gtk = {
      enable = true;

      theme = {
        package = pkgs.adw-gtk3;
        name = "adw-gtk3-dark";
      };
      iconTheme.name = "Adwaita";
      colorScheme = "dark";

      gtk3 = {
        extraCss = extraCss + ''
          button.suggested-action {
            color: @accent_fg_color;
          }
        '';
      };
      gtk4 = {
        theme = null;
        extraCss = extraCss + ''
          :root {
            ${concatMapAttrsStringSep "\n  " (name: value: "--${name}: ${value};") cssVars}
          }
        '';
      };
    };
  };
}
