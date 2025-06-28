{
  hostname = "luka-desktop";
  user = "luka";

  nixos = { config, pkgs, system, ... }: {
    imports = [ ./hardware.nix ];

    boot.loader.grub.device = "nodev";
    boot.loader.grub.efiSupport = true;
    boot.loader.grub.useOSProber = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.extraModulePackages = [ config.boot.kernelPackages.rtl8192eu ];

    networking.wireless.iwd.enable = true;
    networking.networkmanager.enable = true;
    networking.networkmanager.wifi.backend = "iwd";

    services.pipewire = {
      enable = true;
      pulse.enable = true;
    };

    programs.hyprland.enable = true;
    programs.firefox.enable = true;

    users.users.${system.user}.packages = with pkgs; [
      ghostty
      wofi
      nautilus
    ];

    services.tailscale = {
      enable = true;
      useRoutingFeatures = "both";
    };

    xdg.portal.enable = true;
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-wlr ];
  };

  home = { ... }: {
  };
}
