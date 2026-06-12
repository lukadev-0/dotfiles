{ pkgs, config, ... }:

{
  home.packages = with pkgs; [ neovim ];
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    MANPAGER = "nvim +Man!";
    MANWIDTH = "80";
  };
  xdg.configFile.nvim.source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/neovim";
  xdg.dataFile."nvim/luka/typescript".source = pkgs.typescript + "/lib/node_modules/typescript";
}
