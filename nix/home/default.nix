{ ... }:

{
  imports = [
    ./bat.nix
    ./git.nix
    ./neovim.nix
    ./packages.nix
    ./shell.nix
    ./tmux.nix
  ];

  home.sessionVariables = {
    COLORTERM = "truecolor";
  };

  home.stateVersion = "25.05";
}
