{ pkgs, ... }:

{
  imports = [
    ../home/ags.nix
    ../home/browser.nix
    ../home/dunst.nix
    ../home/hyprland.nix
    ../home/neovim.nix
    ../home/shell.nix
    ../home/terminal.nix
    ../home/theme.nix
    ../home/xdg.nix
  ];

  home.stateVersion = "24.05";

  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    discord
    nixfmt-rfc-style
    nautilus
    vscode
    gh
  ];

  home.sessionPath = ["$HOME/.pesde/bin"];
}
