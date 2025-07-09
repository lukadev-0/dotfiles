{ ... }:
{
  imports = [
    ./bat.nix
    ./direnv.nix
    ./git.nix
    ./neovim.nix
    ./packages.nix
    ./starship.nix
    ./tmux.nix
    ./zsh.nix
  ];

  home.sessionVariables = {
    COLORTERM = "truecolor";
  };

  home.stateVersion = "25.05";
}
