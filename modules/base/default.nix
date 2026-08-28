{ lib, config, ... }:
let
  inherit (lib) types mkOption;
in
{
  imports = [
    ./bat.nix
    ./colors.nix
    ./direnv.nix
    ./git.nix
    ./home-manager.nix
    ./man-pages.nix
    ./mise.nix
    ./neovim.nix
    ./nh.nix
    ./nix-ld.nix
    ./nix.nix
    ./nixos.nix
    ./nixpkgs.nix
    ./sccache.nix
    ./shell
    ./ssh.nix
    ./tmux.nix
    ./tools.nix
    ./user.nix
    ./zellij.nix
  ];

  options = {
    hostname = mkOption {
      type = types.str;
    };
    username = mkOption {
      type = types.str;
      default = "luka";
    };
    homeDir = mkOption {
      type = types.externalPath;
      default = "/home/${config.username}";
    };
    dotfilesDir = mkOption {
      type = types.externalPath;
      default = "${config.homeDir}/.dotfiles";
    };
  };
}
