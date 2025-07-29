{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bun
    lune
    nodejs
    python3
    ripgrep
    rustup
    tree-sitter
  ];
}
