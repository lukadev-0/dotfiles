{ ... }:
{
  nixos.security.polkit = {
    enable = true;
    enablePkexecWrapper = true;
  };
  home.services.polkit-gnome.enable = true;
}
