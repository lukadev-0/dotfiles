{ config, ... }:
let
  inherit (config) colors;
in
{
  home = { config, ... }: {
    programs.firefox = {
      enable = true;
      configPath = "${config.xdg.configHome}/mozilla/firefox";
      profiles.default = {
        extensions.settings."FirefoxColor@mozilla.com" = {
          force = true;
          settings = {
            firstRunDone = true;
            theme = {
              title = "Generated Theme";
              colors = {
                frame = colors.rgb.crust;
                toolbar = colors.rgb.base;
                toolbar_text = colors.rgb.text;
                toolbar_field = colors.rgb.surface0;
                toolbar_field_text = colors.rgb.text;
                toolbar_field_border_focus = colors.rgb.accent // {
                  a = 0.5;
                };
                toolbar_field_highlight = colors.rgb.surface2;
                toolbar_field_separator = colors.rgb.surface0;
                toolbar_vertical_separator = colors.rgb.surface0;
                icons = colors.rgb.text;
                tab_background_text = colors.rgb.subtext1;
                tab_line = colors.rgb.overlay0;
                popup = colors.rgb.surface0;
                popup_border = colors.rgb.surface1;
                popup_highlight = colors.rgb.accent // {
                  a = 0.2;
                };
                ntp_background = colors.rgb.base;
                ntp_text = colors.rgb.text;
                sidebar = colors.rgb.mantle;
                sidebar_border = colors.rgb.surface0;
                sidebar_text = colors.rgb.text;
                sidebar_highlight = colors.rgb.surface2;
              };
            };
          };
        };
      };
    };
  };
}
