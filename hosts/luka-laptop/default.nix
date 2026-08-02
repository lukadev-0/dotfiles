{ ... }:
{
  imports = [ ../../modules/presets/wsl.nix ];

  hostname = "luka-laptop";

  nixos = {
    nixpkgs.hostPlatform = "x86_64-linux";
  };
}
