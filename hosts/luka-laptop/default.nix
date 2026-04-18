{ self, inputs, ... }:

{
  flake.nixosConfigurations.luka-laptop = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      self.nixosModules.base
      inputs.nixos-wsl.nixosModules.default
      (
        { config, ... }:
        {
          dotfiles.hostname = "luka-laptop";
          dotfiles.homeModules = [
            self.homeModules.with-wsl-ssh-relay
          ];

          wsl.enable = true;
          wsl.defaultUser = config.dotfiles.username;
        }
      )
    ];
  };
}
