let
  modules = {
    nixos = {};
    home = {};
  };
in

{ nixpkgs, home-manager, ... }@inputs:
{ hostname, user, nixos, home }@system:

nixpkgs.lib.nixosSystem {
  system = "x86_64-linux";
  specialArgs = { inherit inputs system; };
  modules = [
    ./base.nix
    home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.extraSpecialArgs = { inherit inputs system; };
      home-manager.users.${user} = { pkgs, ... }@args: {
        imports = [
          ../home
          (home (args // {
            modules = modules.home;
            inherit pkgs;
          }))
        ];
      };
    }
    ({ pkgs, ... }@args: nixos (args // {
      modules = modules.nixos;
      inherit pkgs;
    }))
  ];
}
