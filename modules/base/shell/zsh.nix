{ pkgs, config, ... }:
let
  inherit (config) colors;
in
{
  nixos.programs.zsh.enable = true;
  home = {
    home.shell.enableZshIntegration = true;
    programs.zsh = {
      enable = true;
      plugins = [
        {
          name = "vi-mode";
          src = pkgs.zsh-vi-mode;
          file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
        }
        {
          name = "zsh-history-substring-search";
          src = pkgs.fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-history-substring-search";
            rev = "87ce96b1862928d84b1afe7c173316614b30e301";
            hash = "sha256-1+w0AeVJtu1EK5iNVwk3loenFuIyVlQmlw8TWliHZGI=";
          };
        }
      ];
      syntaxHighlighting.enable = true;
      autosuggestion.enable = true;
      enableCompletion = true;
      localVariables = {
        HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND = "bg=${colors.surface1},fg=${colors.text}";
        HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND = "bg=${colors.surface1},fg=${colors.error}";
        HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_TIMEOUT = 0.5;
      };
      initContent = ''
        bindkey '^[[A' history-substring-search-up
        bindkey '^[[B' history-substring-search-down
        bindkey '^[OA' history-substring-search-up
        bindkey '^[OB' history-substring-search-down

        bindkey '^[[1;5C' forward-word

        bindkey '^[[Z' reverse-menu-complete
        zstyle ':completion:*' menu select

        precmd() {
          if [[ -z "$NEW_LINE_BEFORE_PROMPT" ]]; then
            NEW_LINE_BEFORE_PROMPT=1
          else
            print ""
          fi

          # Set the title
          print -Pn "\e]0;%~\a"
        }
      '';
    };
  };
}
