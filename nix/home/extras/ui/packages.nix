{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ghostty
    firefox
    wofi
    nautilus
  ];
}
