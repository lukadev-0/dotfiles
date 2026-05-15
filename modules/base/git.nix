{ config, ... }:
let
  inherit (config) colors ssh;
in
{
  home = {
    programs.git = {
      enable = true;

      settings = {
        user.email = "hi@lukadev.me";
        user.name = "LukaDev";

        init.defaultBranch = "main";
        pull.rebase = true;
        push.autoSetupRemote = true;
        rerere.enabled = true;
      };

      signing = {
        signByDefault = true;
        format = "ssh";
        inherit (ssh) key;
      };
    };

    programs.delta = {
      enable = true;
      enableGitIntegration = true;
      options = {
        syntax-theme = "evergarden";
        dark = true;
        line-numbers = true;
        line-numbers-minus-style = "red";
        line-numbers-plus-style = "green";
        line-numbers-zero-style = colors.subtext0;
        line-numbers-left-style = colors.surface1;
        line-numbers-right-style = colors.surface1;
        minus-style = "syntax ${colors.lib.mix colors.base colors.red 0.1}";
        minus-emph-style = "syntax ${colors.lib.mix colors.base colors.red 0.2}";
        plus-style = "syntax ${colors.lib.mix colors.base colors.green 0.1}";
        plus-emph-style = "syntax ${colors.lib.mix colors.base colors.green 0.2}";
      };
    };

    programs.gh = {
      enable = true;
      gitCredentialHelper.enable = true;
    };
  };
}
