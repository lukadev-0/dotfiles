{ lib, inputs, ... }:
let
  inherit (lib) types mkOption;
  inherit (inputs) home-manager;
in
{
  options = {
    home = mkOption {
      type = types.deferredModule;
    };
  };

  config = {
    home = {
      home.stateVersion = "25.05";
    };

    nixos = {
      imports = [ home-manager.nixosModules.home-manager ];
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
    };
  };
}
