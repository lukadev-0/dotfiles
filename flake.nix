{
  description = "luka's dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    nixos-wsl.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        ./home
        ./hosts
        ./nixos
      ];
      systems = [
        "x86_64-linux"
      ];
      flake = {
      };
      perSystem =
        { pkgs, ... }:
        {
          formatter = pkgs.nixfmt-tree;
        };
    };
}
