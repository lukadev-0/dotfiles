{ config, pkgs, ... }:
let
  inherit (config) username homeDir home;
in
{
  nixos = { config, ... }: {
    users.users.${username} = {
      isNormalUser = true;
      home = homeDir;
      extraGroups = [
        "wheel"
        "docker"
      ];
      shell = pkgs.zsh;
    };

    home-manager.users.${username} = home;
  };
}
