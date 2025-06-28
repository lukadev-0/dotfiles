{ pkgs, system, ... }:

{
  # Base configuration
  networking.hostName = system.hostname;
  time.timeZone = "Europe/Brussels";
  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "us";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # System packages
  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    git
    gcc
    file
    tree
  ];

  programs.zsh.enable = true;
  programs.nix-ld.enable = true;
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # System environment
  environment.variables = {
    EDITOR = "vim";
    VISUAL = "vim";
  };
  environment.pathsToLink = [ "/share/zsh" ];

  # User
  users.users.${system.user} = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
  };

  system.stateVersion = "24.11";
}
