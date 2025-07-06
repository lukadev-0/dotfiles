{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ghostty
    firefox
    wofi
    nautilus
    wl-clipboard
    pavucontrol
    gcr
  ];

  services.gnome-keyring.enable = true;
}
