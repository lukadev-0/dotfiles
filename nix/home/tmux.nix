{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    mouse = true;
    prefix = "'C-\\'";
    baseIndex = 1;
    clock24 = true;
    escapeTime = 0;
    sensibleOnTop = true;
    plugins = with pkgs; [
      tmuxPlugins.catppuccin
      tmuxPlugins.yank
    ];
    extraConfig = ''
      set-option -sa terminal-overrides ",xterm*:Tc"
      set-option -g renumber-windows on
    '';
  };
}
