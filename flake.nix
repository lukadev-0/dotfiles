{
  description = "luka's dotfiles";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    evergarden-bat = {
      url = "git+https://codeberg.org/evergarden/bat";
      flake = false;
    };
    evergarden-tmux = {
      url = "git+https://codeberg.org/evergarden/tmux";
      flake = false;
    };
  };

  outputs =
    inputs@{ nixpkgs, ... }:
    let
      inherit (nixpkgs.lib)
        evalModules
        mkOption
        nixosSystem
        types
        ;

      mkNixos =
        module:
        let
          nixosEvalModule = { config, ... }: {
            options = {
              eval.nixos = mkOption { type = types.raw; };
            };
            config = {
              eval.nixos = nixosSystem {
                modules = [ config.nixos ];
              };

              _module.args = {
                inherit (config.eval.nixos) pkgs;
              };
            };
          };

          evaluation = evalModules {
            modules = [
              ./modules/base
              nixosEvalModule
              module
            ];
            specialArgs = {
              inherit inputs;
            };
          };
        in
        evaluation.config.eval.nixos;
    in
    {
      nixosConfigurations = {
        luka-desktop = mkNixos (import ./hosts/luka-desktop);
        luka-laptop = mkNixos (import ./hosts/luka-laptop);
      };
    };
}
