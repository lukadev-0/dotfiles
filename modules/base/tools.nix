{ pkgs, ... }:
{
  nixos.environment.systemPackages = with pkgs; [
    curl
    file
    gcc
    git
    gnumake
    wget
  ];

  home.home.packages = with pkgs; [
    btop
    cachix
    fd
    jq
    just
    meson
    ninja
    nixfmt
    ripgrep
    tree
    tree-sitter
    unzip

    # C/C++
    cmake
    clang-tools

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
