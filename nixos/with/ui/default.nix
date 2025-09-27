{ pkgs, ... }:

{
  imports = [ ./niri.nix ];

  fonts.enableDefaultPackages = false;
  security.pam.services.login.enableGnomeKeyring = true;
}
