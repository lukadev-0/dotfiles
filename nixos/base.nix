{
  lib,
  config,
  pkgs,
  ...
}:

let
  inherit (lib) mkOption types;
in
{
  options.dotfiles = {
    hostname = mkOption { type = types.str; };
    username = mkOption {
      type = types.str;
      default = "luka";
    };
    homeModules = mkOption {
      type = types.listOf (types.deferredModule);
      default = [ ];
    };
  };

  config = {
    # Base configuration
    networking.hostName = config.dotfiles.hostname;
    time.timeZone = "Europe/Brussels";
    i18n.defaultLocale = "en_US.UTF-8";
    console.keyMap = "us";

    nix.settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = [
        "@wheel"
      ];
    };

    # System packages
    environment.systemPackages = with pkgs; [
      btop
      cmake
      curl
      file
      gcc
      git
      gnumake
      jq
      kmod
      meson
      ninja
      tree
      unzip
      vim
      wget
    ];

    programs.zsh.enable = true;
    programs.nix-ld = {
      enable = true;
      libraries = with pkgs; [ dbus ];
    };
    programs.mtr.enable = true;
    programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    virtualisation.docker = {
      enable = true;
    };

    # System environment
    environment.variables = {
      EDITOR = "vim";
      VISUAL = "vim";
    };
    environment.pathsToLink = [ "/share/zsh" ];

    # User
    users.users.${config.dotfiles.username} = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "docker"
      ];
      shell = pkgs.zsh;
    };

    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.users.${config.dotfiles.username} = {
      imports = config.dotfiles.homeModules;
    };

    system.stateVersion = "24.11";
  };
}
