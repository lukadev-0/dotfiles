{ ... }:
{
  imports = [
    ./bat.nix
    ./git.nix
    ./neovim.nix
    ./packages.nix
    ./zsh.nix
    ./tmux.nix
  ];

  home.sessionVariables = {
    COLORTERM = "truecolor";
  };

  home.stateVersion = "25.05";
}
