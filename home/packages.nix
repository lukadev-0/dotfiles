{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ripgrep
    rustup
    nodejs
    bun
    lune
    python3
  ];
}
