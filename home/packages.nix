{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bun
    just
    lune
    mise
    nodejs
    python3
    ripgrep
    rustup
    tree-sitter
  ];
}
