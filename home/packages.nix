{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bun
    cachix
    deno
    just
    lune
    nodejs
    pnpm
    python3
    ripgrep
    rustup
    tree-sitter
  ];
}
