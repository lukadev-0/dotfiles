{ pkgs, lib, ... }:
let
  inherit (lib) getExe;
  socketName = "wsl-ssh-agent";
  npiperelay = pkgs.callPackage ./npiperelay.nix { };
in
{
  home = {
    home.sessionVariables.SSH_AUTH_SOCK = "\${XDG_RUNTIME_DIR%/}/${socketName}";

    systemd.user.sockets.wsl-ssh-agent-relay = {
      Unit.Description = "Socket for WSL SSH Agent Relay";
      Socket.ListenStream = "%t/${socketName}";
      Install.WantedBy = [ "sockets.target" ];
    };

    systemd.user.services.wsl-ssh-agent-relay = {
      Unit = {
        Description = "WSL SSH Agent Relay";
        Requires = [ "wsl-ssh-agent-relay.socket" ];
      };
      Service = {
        Type = "exec";
        ExecStart = "${getExe pkgs.socat} ACCEPT-FD:3,fork EXEC:\"${getExe npiperelay} -ei -s //./pipe/openssh-ssh-agent\",nofork";
      };
    };
  };
}
