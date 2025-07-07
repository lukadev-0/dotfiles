{ inputs, ... }:

{
  imports = [
    inputs.home-manager.flakeModules.home-manager
  ];

  flake.homeModules = {
    base = ./base.nix;
    with-ui = ./with/ui;
    with-wsl-ssh-relay = ./with/wsl-ssh-relay.nix;
  };
}
