{ pkgs, ... }:

{
  home.packages = with pkgs; [
    cachix
    fd
    just
    ripgrep
    tree-sitter

    # JS/TS
    astro-language-server
    bun
    deno
    nodejs
    pnpm
    prettier
    tailwindcss-language-server
    typescript-language-server

    # Lua/Luau
    lua-language-server
    luau-lsp
    lune
    stylua

    # Nix
    nixfmt

    # Python
    python3

    # Rust
    rustup
  ];
}
