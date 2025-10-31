{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bun
    cachix
    just
    lune
    nodejs
    python3
    ripgrep
    rustup
    tree-sitter
  ];
}
