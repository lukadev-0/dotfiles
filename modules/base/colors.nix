{ lib, config, ... }:
let
  inherit (lib)
    attrNames
    fixedWidthNumber
    floor
    fromHexString
    genAttrs
    mapAttrs
    mkDefault
    mkOption
    removeAttrs
    substring
    toHexString
    toJSON
    types
    ;

  colors = {
    red = "#f57f82";
    orange = "#f7a182";
    yellow = "#f5d098";
    lime = "#dbe6af";
    green = "#cbe3b3";
    teal = "#b3e3ca";
    cyan = "#b3e6db";
    sky = "#afd9e6";
    blue = "#b2caed";
    purple = "#d2bdf3";
    pink = "#f3c0e5";

    text = "#f8f9e8";
    subtext1 = "#adc9bc";
    subtext0 = "#96b4aa";
    overlay2 = "#839e9a";
    overlay1 = "#6f8788";
    overlay0 = "#58686d";
    surface2 = "#4a585c";
    surface1 = "#374145";
    surface0 = "#262f33";
    base = "#1e2528";
    mantle = "#191e21";
    crust = "#171c1f";
  };

  aliases = {
    accent = "blue";
    error = "red";
    success = "green";
    warning = "yellow";
  };

  colorNames = attrNames colors ++ attrNames aliases;

  colorLib = {
    red = c: fromHexString (substring 1 2 c);
    green = c: fromHexString (substring 3 2 c);
    blue = c: fromHexString (substring 5 2 c);

    toRgb = c: {
      r = colorLib.red c;
      g = colorLib.green c;
      b = colorLib.blue c;
    };

    toHex =
      rgb:
      let
        f = n: fixedWidthNumber 2 (toHexString n);
      in
      "#${f rgb.r}${f rgb.g}${f rgb.b}";

    mixRgb =
      rgbFrom: rgbTo: w:
      let
        mixNum = a: b: floor (a + (b - a) * w);
      in
      {
        r = mixNum rgbFrom.r rgbTo.r;
        g = mixNum rgbFrom.g rgbTo.g;
        b = mixNum rgbFrom.b rgbTo.b;
      };

    mix =
      from: to: w:
      colorLib.toHex (colorLib.mixRgb (colorLib.toRgb from) (colorLib.toRgb to) w);
  };

  extra = {
    lib = colorLib;
    hex = cfgColors;
    rgb = mapAttrs (_: colorLib.toRgb) cfgColors;
    css = lib.concatMapAttrsStringSep "\n  " (name: color: "--colors-${name}: ${color};") cfgColors;
  };

  cfgColors = removeAttrs config.colors (attrNames extra);
in
{
  options = {
    colors =
      genAttrs colorNames (
        _:
        mkOption {
          type = types.str;
        }
      )
      // (mapAttrs (_: _: mkOption { type = types.raw; }) extra);
  };

  config = {
    colors = mkDefault (colors // mapAttrs (_: color: cfgColors.${color}) aliases // extra);

    home = {
      xdg.configFile."colors.json" = {
        text = toJSON cfgColors;
      };

      dconf.settings = {
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
        };
      };
    };
  };
}
