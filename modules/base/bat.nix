{ config, inputs, ... }:
let
  inherit (config) colors;
  inherit (inputs) evergarden-bat;
in
{
  home.programs.bat = {
    enable = true;
    themes.evergarden.src = "${evergarden-bat}/themes/evergarden-winter.tmTheme";
    config = {
      theme = "evergarden";
    };
  };
}
