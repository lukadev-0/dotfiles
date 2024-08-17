{ pkgs, inputs, ... }:
let
  gradiencePreset = inputs.gradiencePresets + "/official/catppuccin-mocha.json";
  gradienceStyles = pkgs.stdenv.mkDerivation {
    name = "gradience-styles";
    nativeBuildInputs = [ pkgs.gradience ];
    phases = [ "installPhase" ];
    installPhase = ''
      export HOME=$TMPDIR/gradience-styles
      mkdir -p $out
      mkdir -p $HOME
      mkdir -p $HOME/.config/presets

      gradience-cli apply -p ${gradiencePreset} --gtk both
      cp -r $HOME/.config/gtk-4.0 $out/
      cp -r $HOME/.config/gtk-3.0 $out/
    '';
  };
  gtkExtraCss = ''
    @define-color sidebar_bg_color @window_bg_color;
    @define-color sidebar_fg_color @window_fg_color;
    @define-color sidebar_border_color @window_bg_color;
    @define-color sidebar_backdrop_color @window_bg_color;
  '';
in
{
  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin
    ../theme.nix
  ];

  home.pointerCursor = {
     package = pkgs.adwaita-icon-theme;
     name = "Adwaita";
     size = 24;
  };

  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };
    font = {
      package = pkgs.geist-font;
      name = "Geist";
      size = 11;
    };
    gtk3 = {
      extraCss = "${builtins.readFile "${gradienceStyles}/gtk-3.0/gtk.css"}\n${gtkExtraCss}";
      extraConfig = {
        gtk-application-prefer-dark-theme = 1;
      };
    };
    gtk4 = {
      extraCss = "${builtins.readFile "${gradienceStyles}/gtk-4.0/gtk.css"}\n${gtkExtraCss}";
      extraConfig = {
        gtk-application-prefer-dark-theme = 1;
      };
    };
  };

  qt = {
    enable = true;
    style.name = "kvantum";
    platformTheme.name = "kvantum";
  };
}
