{ pkgs, ... }:

{
  imports = [ ./hyprland.nix ];

  fonts.enableDefaultPackages = false;
  security.pam.services.login.enableGnomeKeyring = true;
}
