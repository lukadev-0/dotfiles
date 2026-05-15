{ lib, config, ... }:
let
  inherit (lib) types mkOption;
in
{
  options = {
    nixos = mkOption {
      type = types.deferredModule;
    };
  };

  config = {
    nixos = {
      system.stateVersion = "24.11";

      networking.hostName = config.hostname;
      time.timeZone = "Europe/Brussels";
      i18n.defaultLocale = "en_US.UTF-8";
      console.keyMap = "us";
    };
  };
}
