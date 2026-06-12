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

        nixpkgs.overlays = [
          (final: prev: {
            tmuxPlugins = prev.tmuxPlugins // {
              evergarden = final.callPackage ../pkgs/tmuxPlugins-evergarden/package.nix {
                inherit (inputs) evergarden-tmux;
              };
            };
          })
        ];
      };
    with-ui =
      { ... }:
      {
        imports = [ ./with/ui ];
        dotfiles.homeModules = [ self.homeModules.with-ui ];
      };
  };
}
