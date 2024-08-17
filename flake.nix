{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    catppuccin.url = "github:catppuccin/nix";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    ags.url = "github:Aylur/ags";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    gradiencePresets = {
      url = "github:GradienceTeam/Community";
      flake = false;
    };
    catppuccinWarp = {
      url = "github:catppuccin/warp";
      flake = false;
    };
  };
  outputs = { self, nixpkgs, ... }@attrs: {
    nixosConfigurations = {
      luka-nixos = import ./hosts/luka-nixos attrs;
    };
  };
}
