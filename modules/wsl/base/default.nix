{
  config,
  inputs,
  pkgs,
  ...
}:
let
  inherit (config) username;
  inherit (inputs) nixos-wsl;
  windows-terminal-terminfo = pkgs.callPackage ./windows-terminal-terminfo.nix { };
in
{
  nixos = {
    imports = [ nixos-wsl.nixosModules.default ];
    wsl = {
      enable = true;
      defaultUser = username;
    };
    environment.systemPackages = [ windows-terminal-terminfo ];
  };
}
