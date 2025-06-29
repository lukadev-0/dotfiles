{ pkgs, ... }:

{
  programs.git = {
    enable = true;

    userEmail = "hi@lukadev.me";
    userName = "LukaDev";

    signing = {
      signByDefault = true;
      format = "ssh";
    };
    extraConfig.gpg.ssh.defaultKeyCommand = "ssh-add -L | head -n1";

    extraConfig.init.defaultBranch = "main";
    extraConfig.pull.rebase = true;
    extraConfig.push.autoSetupRemote = true;
    extraConfig.rerere.enabled = true;

    delta = {
      enable = true;
      options = {
        features = "catppuccin-mocha";
      };
    };

    includes = [
      {
        path = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "delta";
          rev = "313b3ac74c44c0f5264b974bf8bc0cec0e3382f9";
          sha256 = "sha256-A1UknH+3/zwxjzQ6y4SvPar3dGwEaIpboFU6iMd++k4";
        } + "/catppuccin.gitconfig";
      }
    ];
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };
}
