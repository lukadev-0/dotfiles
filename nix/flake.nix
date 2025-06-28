{
  description = "luka's dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    nixosSystem = path: import ./nixos inputs (import path);
  in
  {
    nixosConfigurations.luka-desktop = nixosSystem ./hosts/luka-desktop;
    nixosConfigurations.luka-laptop = nixosSystem ./hosts/luka-laptop;
  };
}
