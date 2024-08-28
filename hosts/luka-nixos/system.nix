{ config, lib, pkgs, ... }:

{
  system.stateVersion = "24.05";

  boot = {
    loader.grub = {
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
    };

    extraModulePackages = with config.boot.kernelPackages; [ rtl8192eu ];
  };

  networking = {
    hostName = "luka-nixos";

    wireless.iwd.enable = true;
    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
    };
  };

  time.timeZone = "Europe/Brussels";

  users.users.root.initialHashedPassword = "";
}

