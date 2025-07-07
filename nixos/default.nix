{ self, inputs, ... }:

{
  flake.nixosModules = {
    base =
      { ... }:
      {
        imports = [
          ./base.nix
          inputs.home-manager.nixosModules.home-manager
        ];
        dotfiles.homeModules = [ self.homeModules.base ];
      };
    with-ui =
      { ... }:
      {
        imports = [ ./with/ui ];
        dotfiles.homeModules = [ self.homeModules.with-ui ];
      };
  };
}
