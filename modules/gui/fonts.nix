{ pkgs, ... }:
{
  nixos.fonts.enableDefaultPackages = false;

  home = {
    home.packages = with pkgs; [
      dejavu_fonts
      inter
      nerd-fonts.jetbrains-mono
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      twitter-color-emoji
    ];

    fonts.fontconfig = {
      enable = true;
      defaultFonts = {
        emoji = [ "Twitter Color Emoji" ];
        sansSerif = [ "Inter" ];
        monospace = [ "JetBrainsMono Nerd Font" ];
      };
    };
  };
}
