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

  services.printing.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryPackage = pkgs.pinentry-qt;
  };

  users.users.root.initialHashedPassword = "";
}

