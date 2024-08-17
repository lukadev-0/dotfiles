{ pkgs, config, ... }:

{
  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/neovim";
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    catppuccin.enable = false;
    extraPackages = with pkgs; [
      gcc
    ];
  };
}
