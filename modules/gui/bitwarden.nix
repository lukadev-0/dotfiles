{ pkgs, config, ... }:
let
  inherit (config) homeDir;
in
{
  home = {
    home.packages = with pkgs; [ bitwarden-desktop ];
    home.sessionVariables.SSH_AUTH_SOCK = "${homeDir}/.bitwarden-ssh-agent.sock";
  };

  nixos.nixpkgs.config.permittedInsecurePackages = [
    "electron-39.8.10"
  ];

  niri.config = ''
    window-rule {
      match app-id=r#"^Bitwarden$"#
      block-out-from "screencast"
    }
  '';
}
