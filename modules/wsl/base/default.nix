{ config, inputs, ... }:
let
  inherit (config) username;
  inherit (inputs) nixos-wsl;
in
{
  nixos = {
    imports = [ nixos-wsl.nixosModules.default ];
    wsl = {
      enable = true;
      defaultUser = username;
    };
  };
}
