{ lib, config, ... }:
let
  inherit (lib) concatMapAttrsStringSep;
  inherit (config) colors;
in
{
  imports = [ ./config.nix ];

  home.programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = ''
      ${concatMapAttrsStringSep "\n" (name: color: "@define-color ${name} ${color};") colors.hex}
      @import "${./styles.css}";
    '';
  };

  niri.config = ''
    layer-rule {
      match namespace="waybar"
      shadow {
        on
        softness 8
        spread 0
        offset x=2
      }
      background-effect {
        blur true
        xray false
      }
    };
  '';
}
