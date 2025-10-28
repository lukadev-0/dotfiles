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

    includes = [
      {
        path =
          pkgs.fetchFromGitHub {
            owner = "catppuccin";
            repo = "delta";
            rev = "313b3ac74c44c0f5264b974bf8bc0cec0e3382f9";
            sha256 = "sha256-A1UknH+3/zwxjzQ6y4SvPar3dGwEaIpboFU6iMd++k4";
          }
          + "/catppuccin.gitconfig";
      }
    ];
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      features = "catppuccin-mocha";
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };
}
