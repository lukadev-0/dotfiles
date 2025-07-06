{ pkgs, ... }:

{
  home.packages = with pkgs; [
    firefox
    wofi
    nautilus
    wl-clipboard
    pavucontrol
    gcr
  ];

  services.gnome-keyring.enable = true;
}
