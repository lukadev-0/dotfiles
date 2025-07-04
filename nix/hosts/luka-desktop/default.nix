{
  hostname = "luka-desktop";
  user = "luka";

  nixos = { config, pkgs, system, extras, ... }: {
    imports = [
      ./hardware.nix
      extras.ui
    ];

    boot.loader.grub.device = "nodev";
    boot.loader.grub.efiSupport = true;
    boot.loader.grub.useOSProber = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.extraModulePackages = [ config.boot.kernelPackages.rtl8192eu ];

    networking.wireless.iwd.enable = true;
    networking.networkmanager.enable = true;
    networking.networkmanager.wifi.backend = "iwd";

    hardware.bluetooth.enable = true;

    services.pipewire = {
      enable = true;
      pulse.enable = true;
    };

    services.tailscale = {
      enable = true;
      useRoutingFeatures = "both";
    };
  };

  home = { extras, ... }: {
    imports = [ extras.ui ];
  };
}
