{ pkgs, inputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    inputs.catppuccin.nixosModules.catppuccin
    ../nix.nix
    ../theme.nix
  ];

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    neovim
    wget
    nix
    git
    file
    usbutils
    killall
    kitty
    wl-clipboard
    wofi
    gh
    fastfetch
    pavucontrol
    libnotify
    rustup
    bun
    desktop-file-utils
    nodejs_22
    gcc
  ];

  fonts.packages = with pkgs; [
    geist-font
    twemoji-color-font
    noto-fonts
    noto-fonts-cjk
    (nerdfonts.override {
      fonts = [ "FiraCode" ];
    })
  ];

  programs = {
    zsh.enable = true;
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    };
    nix-ld.enable = true;
  };

  services = {
    flatpak.enable = true;
    xserver = {
      enable = true;
      exportConfiguration = true;
    };
    tailscale = {
      enable = true;
      useRoutingFeatures = "server";
    };
  };

  security.rtkit.enable = true;
  security.polkit.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  users.users.luka = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    shell = pkgs.zsh;
  };

  home-manager.extraSpecialArgs = {
    inherit inputs;
  };
  home-manager.users.luka = import ./home.nix;
}
