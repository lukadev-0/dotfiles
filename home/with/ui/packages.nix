{ pkgs, ... }:

{
  home.packages = with pkgs; [
    firefox
    wofi
    nautilus
    wl-clipboard
    pavucontrol
    gcr
    vesktop
  ];

  services.gnome-keyring.enable = true;
}
