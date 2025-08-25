{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bun
    just
    lune
    nodejs
    python3
    ripgrep
    rustup
    tree-sitter
  ];
}
