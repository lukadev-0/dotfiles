{ pkgs, ... }:

let
  sshKeys = import ../ssh-keys.nix;
in
{
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
      key = sshKeys.me;
    };
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      syntax-theme = "Evergarden";
      dark = true;
      line-numbers = true;
      line-numbers-minus-style = "red";
      line-numbers-plus-style = "green";
      line-numbers-zero-style = "#96b4aa";
      line-numbers-left-style = "#374145";
      line-numbers-right-style = "#374145";
      minus-style = "syntax #342e31";
      minus-emph-style = "syntax #49373a";
      plus-style = "syntax #2f3836";
      plus-emph-style = "syntax #414b44";
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };
}
