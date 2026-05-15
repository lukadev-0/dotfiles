{ lib, config, ... }:
let
  inherit (lib) mkOption types;
  inherit (config) username ssh;
in
{
  options = {
    ssh.key = mkOption {
      type = types.str;
      default = (import ../../ssh-keys.nix).me;
    };
  };

  config = {
    nixos = {
      services.openssh = {
        enable = true;
        settings = {
          PasswordAuthentication = false;
          KbdInteractiveAuthentication = false;
        };
      };

      users.users.${username}.openssh.authorizedKeys.keys = [ ssh.key ];
      users.users.root.openssh.authorizedKeys.keys = [ ssh.key ];
    };
  };
}
