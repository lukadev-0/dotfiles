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
    terminal = "tmux-256color";
    plugins =
      let
        inherit (pkgs) tmuxPlugins;
      in
      [
        tmuxPlugins.yank
        {
          plugin = tmuxPlugins.evergarden;
          extraConfig = "set -gq @evergarden_variant 'winter'";
        }
      ];
    extraConfig = ''
      set-option -a terminal-features ',xterm*:RGB'
      set-option -g renumber-windows on

      if-shell 'test -n "$WSL_DISTRO_NAME"' {
        set -as terminal-overrides ',*:Setulc=\E[58::2::::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'
        set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'
      }
    '';
  };
}
