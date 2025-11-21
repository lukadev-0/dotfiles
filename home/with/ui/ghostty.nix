{ ... }:

{
  programs.ghostty = {
    enable = true;
    settings = {
      theme = "Catppuccin Mocha";
      font-family = "JetBrainsMono Nerd Font";
      font-size = 10;
      window-padding-x = 8;
      window-padding-y = 8;
      adjust-cell-height = "10%";
    };
  };
}
