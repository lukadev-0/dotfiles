{ pkgs, ... }:
{
  home.home.packages = with pkgs; [
    nautilus
    wl-clipboard
    pavucontrol
    gcr
    (discord.override { withVencord = true; })
  ];
}
