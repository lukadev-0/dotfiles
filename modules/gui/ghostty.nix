{ config, ... }:
let
  inherit (config) colors;
in
{
  home = {
    home.sessionVariables.TERMINAL = "ghostty";

    programs.ghostty = {
      enable = true;
      settings = {
        theme = "generated";
        font-family = "JetBrainsMono Nerd Font";
        font-size = 10;
        window-padding-x = 8;
        window-padding-y = 8;
        adjust-cell-height = "10%";
      };
      themes.generated = {
        background = colors.base;
        foreground = colors.text;
        cursor-color = colors.accent;
        cursor-text = colors.crust;
        selection-background = colors.surface1;
        selection-foreground = colors.text;
        palette = [
          "0=${colors.surface1}"
          "1=${colors.red}"
          "2=${colors.green}"
          "3=${colors.yellow}"
          "4=${colors.blue}"
          "5=${colors.pink}"
          "6=${colors.teal}"
          "7=${colors.subtext0}"
          "8=${colors.overlay1}"
          "9=${colors.red}"
          "10=${colors.green}"
          "11=${colors.yellow}"
          "12=${colors.blue}"
          "13=${colors.pink}"
          "14=${colors.teal}"
          "15=${colors.subtext1}"
        ];
      };
    };
  };
}
