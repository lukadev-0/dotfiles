{ ... }:
{
  imports = [ ../../modules/presets/pc.nix ];

  hostname = "luka-desktop";

  nixos = {
    imports = [ ./hardware.nix ];

    boot.loader.limine = {
      enable = true;
      extraEntries = ''
        /Windows
          protocol: efi
          path: boot():/EFI/Microsoft/Boot/bootmgfw.efi
      '';
      style = {
        wallpapers = [ ];
      };
    };
    boot.loader.efi.canTouchEfiVariables = true;

    # boot.loader.grub.device = "nodev";
    # boot.loader.grub.efiSupport = true;
    # boot.loader.grub.useOSProber = true;

    networking.networkmanager.wifi.backend = "iwd";
  };
}
