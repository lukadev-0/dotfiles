{ pkgs, ... }:

let
  mantle = "#181825";
  red = "#f38ba8";
  yellow = "#f9e2af";
  green = "#a6e3a1 ";
  teal = "#94e2d5";
  sapphire = "#74c7ec";
  blue = "#89b4fa";
  lavender = "#b4befe";
  text = "#cdd6f4";
  subtext0 = "#a6adc8";
  surface1 = "#45475a";

  user = sapphire;
  cwd = blue;
  vcs = lavender;
  vcsBranch = teal;
  vcsDirty = yellow;
  success = green;
  error = red;
in
{
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
          sha256 = "sha256-1+w0AeVJtu1EK5iNVwk3loenFuIyVlQmlw8TWliHZGI=";
        };
      }
    ];
    syntaxHighlighting = {
      enable = true;
    };
    enableCompletion = true;
    localVariables = {
      HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND = "bg=${surface1},fg=${text}";
      HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND = "bg=${surface1},fg=${error}";
      HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_TIMEOUT = 0.5;
    };
    initContent = ''
      bindkey '^[[A' history-substring-search-up
      bindkey '^[[B' history-substring-search-down
      bindkey '^[OA' history-substring-search-up
      bindkey '^[OB' history-substring-search-down
      zstyle ':completion:*' menu select

      setopt PROMPT_SUBST
      PROMPT=$'%F{${user}}%n@%M ''${vcs_info_msg_0_:-"%F{${cwd}}%~"}\n%F{${text}}%F{${success}}%(?..%F{${error}})󰅂%f '

      autoload -Uz vcs_info
      zstyle ':vcs_info:*' enable git
      zstyle ':vcs_info:git*' formats "%F{${vcs}}󰊢 %S %F{${vcsBranch}} %b%u"
      zstyle ':vcs_info:git*' actionformats "%F{${vcs}}󰊢 %S %F{${vcsBranch}} %b%u %F{${vcsDirty}}%a"
      zstyle ':vcs_info:git+set-message:*' hooks git-set-message

      function +vi-git-set-message() {
        local repo_dir repo_name rel_path

        repo_dir="''${hook_com[base]}"
        repo_name="''${hook_com[base-name]}"
        rel_path="''${hook_com[subdir]}"

        if [[ -n $rel_path && $rel_path != "." ]]; then
          hook_com[subdir]="$repo_name/$rel_path"
        else
          hook_com[subdir]="$repo_name"
        fi

        if git -C "''${}" status --porcelain | grep -q .; then
          hook_com[unstaged]=" %F{${vcsDirty}}⦁"
        else
          hook_com[unstaged]=""
        fi
      }

      precmd() {
        if [[ -z "$NEW_LINE_BEFORE_PROMPT" ]]; then
          NEW_LINE_BEFORE_PROMPT=1
        else
          print ""
        fi

        vcs_info
      }
    '';
  };
}
