{ pkgs, config, ... }:
let
  inherit (config) dotfilesDir;
in
{
  nixos.environment = {
    systemPackages = [ pkgs.neovim ];
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      MANPAGER = "nvim +Man!";
      MANWIDTH = "80";
    };
  };

  home = { config, ... }: {
    xdg.configFile.nvim.source = config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/nvim";
    xdg.dataFile."nvim/tsdk".source = pkgs.typescript + "/lib/node_modules/typescript";
  };
}
