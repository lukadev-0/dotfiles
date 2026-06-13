{ lib, ... }:

let
  leftModules = [
    "git_branch"
    "git_commit"
    "git_state"
    "git_status"
  ];
  rightModules = [
    "cmd_duration"
    "nix_shell"
    "direnv"
  ];

  concatModules = modules: lib.concatStrings (builtins.map (module: "\$${module}") modules);
in
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      format = ''
        $username$hostname$directory(${concatModules leftModules})$fill${concatModules rightModules}
        $character
      '';
      add_newline = false;

      username = {
        style_root = "bold red";
        style_user = "bold cyan";
        format = "[$user]($style)";
      };

      hostname = {
        style = "bold prev_fg";
        format = "[@$hostname]($style) ";
      };

      directory = {
        style = "bold blue";
        read_only = "[ro]";
        read_only_style = "bold red";
      };

      character = {
        success_symbol = "[󰅂](bold green)";
        error_symbol = "[󰅂](bold red)";
        vimcmd_symbol = "[󰅁](bold blue)";
        vimcmd_replace_one_symbol = "[󰅀](bold red)";
        vimcmd_replace_symbol = "[󰄼](bold red)";
        vimcmd_visual_symbol = "[󰄿](bold purple)";
      };

      git_branch = {
        style = "bold purple";
        format = "[󰘬 $branch(:$remote_branch)]($style)";
        only_attached = true;
      };

      git_commit = {
        style = "bold purple";
        format = "[(󰜘 $hash)( 󰓼 $tag)]($style)";
        tag_disabled = false;
        tag_symbol = "";
      };

      git_status = {
        conflicted = " [CONFLICT](bold red)";
        ahead = "⇡$count";
        diverged = "⇡$ahead_count⇣$behind_count";
        behind = "⇣$count";
        untracked = " ";
        stashed = " 󱇗";
        modified = " ";
        staged = " ";
        renamed = " ";
        deleted = " ";
        style = "bold yellow";
        format = "$conflicted[( $ahead_behind)](bold #f7a182)[$deleted$renamed$modified$typechanged$staged$untracked$stashed]($style)";
      };

      git_state = {
        rebase = "rebase";
        merge = "merge";
        revert = "revert";
        cherry_pick = "cherry-pick";
        bisect = "bisect";
        am = "am";
        am_or_rebase = "am/rebase";
        style = "bold yellow";
        format = " [git $state( \\($progress_current/$progress_total\\))]($style)";
      };

      fill = {
        symbol = " ";
      };

      cmd_duration = {
        style = "bold yellow";
        format = " [󰔛 $duration]($style)";
      };

      nix_shell = {
        heuristic = true;
        style = "bold white";
        format = "  [󱄅 nix( $name)]($style)";
      };

      direnv = {
        disabled = false;
        allowed_msg = "";
        not_allowed_msg = "not allowed";
        denied_msg = "denied";
        loaded_msg = "direnv";
        unloaded_msg = "no direnv";
        style = "bold white";
        format = "  [󱂀 $loaded( \\($allowed\\))]($style)";
      };
    };
  };
}
