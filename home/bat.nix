{ pkgs, ... }:

{
  programs.bat = {
    enable = true;
    themes = {
      "Evergarden" = {
        src = pkgs.fetchFromCodeberg {
          owner = "evergarden";
          repo = "bat";
          rev = "aa5b92e927d1169673050f4f444496590e053487";
          hash = "sha256-Q5ljWahEQcK6GfK1Pj2gXyWoFzVuBBFoW3INxUfKfuk=";
        };
        file = "themes/evergarden-winter.tmTheme";
      };
    };
    config = {
      theme = "Evergarden";
    };
  };
}
