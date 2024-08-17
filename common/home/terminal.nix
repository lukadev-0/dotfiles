{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [ warp-terminal ];

  xdg.dataFile."warp-terminal/themes/" = {
    recursive = true;
    source = inputs.catppuccinWarp + "/themes";
  };
}
