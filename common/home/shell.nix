{ ... }:

{
  programs.bash = {
    enable = true;
    initExtra = ''
      # https://docs.warp.dev/features/subshells
      [ -z $WARP_BOOTSTRAPPED ] && printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "bash"}}\x9c'
    '';
  };

  programs.zsh = {
    enable = true;
    initExtra = ''
      # https://docs.warp.dev/features/subshells
      [ -z $WARP_BOOTSTRAPPED ] && printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "zsh"}}\x9c'
    '';
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" ];
    };
  };
}
