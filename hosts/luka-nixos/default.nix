{ nixpkgs, ... }@inputs:

nixpkgs.lib.nixosSystem {
  system = "x86_64-linux";
  specialArgs = {
    inherit inputs;
  };
  
  modules = [
    ../../common/nixos
    ./hardware.nix
    ./system.nix
  ];
}
