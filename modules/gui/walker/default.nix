{ config, ... }:
let
  inherit (config) colors;
in
{
  home = {
    services.elephant.enable = true;
    systemd.user.services.elephant.Unit.After = [ "niri.service" ];
    services.walker = {
      enable = true;
      systemd.enable = true;
      enableElephantIntegration = true;
      settings = {
        shell = {
          anchor_top = false;
          anchor_bottom = false;
          anchor_left = false;
          anchor_right = false;
        };
      };
      theme.style = ''
        :root {
          ${colors.css}
        }
        @import "${./styles.css}";
      '';
    };
  };

  niri.config = ''
    layer-rule {
      match namespace="walker"
      geometry-corner-radius 20
      shadow {
        on
        softness 24
        spread 0
        offset y=8
      }
      background-effect {
        blur true
        xray false
      }
    }
  '';
}
