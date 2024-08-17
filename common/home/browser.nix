{ pkgs, ... }:

{
  home.sessionVariables.BROWSER = "firefox-devedition";

  programs.firefox = {
    enable = true;
    package = pkgs.firefox-devedition;
  };
}
