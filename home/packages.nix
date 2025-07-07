{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ripgrep
    rustup
    nodejs
  ];
}
