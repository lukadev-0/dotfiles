{ config, ... }:
let
  inherit (config) dotfilesDir;
in
{
  nixos.programs.nh = {
    enable = true;
    flake = dotfilesDir;
  };
}
