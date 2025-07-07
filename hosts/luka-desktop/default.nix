{ self, inputs, ... }:

{
  flake.nixosConfigurations.luka-desktop = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.base
      self.nixosModules.with-ui
      ./hardware.nix
      (
        { config, ... }:
        {
          dotfiles.hostname = "luka-desktop";

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
        }
      )
    ];
  };
}
