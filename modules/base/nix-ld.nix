{ pkgs, ... }:
{
  nixos.programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [ dbus ];
  };
}
