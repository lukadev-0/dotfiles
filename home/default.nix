{ self, inputs, ... }:

{
  imports = [
    inputs.home-manager.flakeModules.home-manager
  ];

  flake.homeModules = {
    base = ./base.nix;
    with-ui =
      { pkgs, ... }:
      {
        imports = [ ./with/ui ];
        home.packages = [ self.packages.${pkgs.stdenv.hostPlatform.system}.luka-shell ];
      };
    with-wsl-ssh-relay = ./with/wsl-ssh-relay.nix;
  };
}
