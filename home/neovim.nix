{ pkgs, config, ... }:

{
  home.packages = with pkgs; [ neovim ];
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
  xdg.configFile.nvim.source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/neovim";
}
