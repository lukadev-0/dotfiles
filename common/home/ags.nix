{ lib, config, inputs, pkgs, ... }:

{
  imports = [ inputs.ags.homeManagerModules.default ];

  xdg.configFile.ags = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/ags";
  };

  programs.ags = {
    enable = true;
    extraPackages = with pkgs; [
      libdbusmenu-gtk3
    ];
  };
}
