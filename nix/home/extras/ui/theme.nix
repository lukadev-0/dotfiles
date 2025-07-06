{ pkgs, ... }:

{
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
}
