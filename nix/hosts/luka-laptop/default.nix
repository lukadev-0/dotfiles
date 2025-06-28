{
  hostname = "luka-laptop";
  user = "luka";

  nixos = { config, pkgs, system, inputs, ... }: {
    imports = [
      inputs.nixos-wsl.nixosModules.default
    ];

    wsl.enable = true;
    wsl.defaultUser = system.user;
  };

  home = { pkgs, ... }: {
    home.packages = with pkgs; [
      wslu
    ];
  };
}
