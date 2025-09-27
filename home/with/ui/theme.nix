{
  lib,
  pkgs,
  config,
  ...
}:

let
  inherit (lib) mkOption types;

  defaultColors = rec {
    rosewater = "#f5e0dc";
    flamingo = "#f2cdcd";
    pink = "#f5c2e7";
    mauve = "#cba6f7";
    red = "#f38ba8";
    maroon = "#eba0ac";
    peach = "#fab387";
    yellow = "#f9e2af";
    green = "#a6e3a1";
    teal = "#94e2d5";
    sky = "#89dceb";
    sapphire = "#74c7ec";
    blue = "#89b4fa";
    lavender = "#b4befe";
    text = "#cdd6f4";
    subtext1 = "#bac2de";
    subtext0 = "#a6adc8";
    overlay2 = "#9399b2";
    overlay1 = "#7f849c";
    overlay0 = "#6c7086";
    surface2 = "#585b70";
    surface1 = "#45475a";
    surface0 = "#313244";
    base = "#1e1e2e";
    mantle = "#181825";
    crust = "#11111b";

    accent = blue;
  };

  inherit (config.dotfiles) colors;
in
{
  options.dotfiles = {
    colors = mkOption {
      type = types.submodule {
        options = lib.mapAttrs (
          name: value:
          mkOption {
            type = types.str;
            default = value;
          }
        ) defaultColors;
      };
      default = { };
    };
  };

  config = {
    home.packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      dejavu_fonts
      geist-font
      nerd-fonts.geist-mono
      twitter-color-emoji
    ];

    fonts.fontconfig = {
      enable = true;
      defaultFonts = {
        emoji = [ "Twitter Color Emoji" ];
        sansSerif = [ "Geist" ];
        monospace = [ "GeistMono Nerd Font" ];
      };
    };

    home.pointerCursor = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
      size = 24;
    };

    dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };

    gtk =
      let
        gtkNamedColors = {
          destructive_bg_color = colors.red;
          destructive_fg_color = colors.crust;
          success_bg_color = colors.green;
          success_fg_color = colors.crust;
          warning_bg_color = colors.peach;
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

        extraCss =
          lib.concatMapAttrsStringSep "\n" (name: color: "@define-color ${name} ${color};") gtkNamedColors
          + "\n"
          + ''
            :root {
              --active-toggle-bg-color: ${colors.surface1};
              --active-toggle-fg-color: ${colors.text};
            ${lib.concatMapAttrsStringSep "\n" (
              name: _: "  --${lib.replaceString "_" "-" name}: @${name};"
            ) gtkNamedColors}
            }
            window.message.dialog.csd:not(.solid-csd),
            window.messagedialog.csd:not(.solid-csd) {
              border-radius: 0;
            }
            toast {
              background: ${colors.surface0};
            }
            banner {
              --banner-color: ${colors.surface2};
            }
          '';
      in
      {
        enable = true;
        theme = {
          package = pkgs.adw-gtk3;
          name = "adw-gtk3-dark";
        };
        iconTheme.name = "Adwaita";

        gtk4 = {
          inherit extraCss;
        };
        gtk3 = {
          inherit extraCss;
        };
      };
  };
}
