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

  home = { pkgs, extras, ... }: {
    imports = [
      extras.wslSshRelay
    ];

    home.packages = with pkgs; [
      wslu
    ];
  };
}
