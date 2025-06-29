{ config, pkgs, ... }:

let
  sshAuthSock = "${config.home.homeDirectory}/.ssh/agent.sock";
  npiperelay = pkgs.stdenv.mkDerivation {
    pname = "npiperelay";
    version = "0.1.0";
    src = pkgs.fetchurl {
      url = "https://github.com/jstarks/npiperelay/releases/download/v0.1.0/npiperelay_windows_amd64.zip";
      sha256 = "sha256-a572H/0XwDUHqaPVTYFdzrPa5mmsZ/w79CJdHnZM5fY=";
    };
    nativeBuildInputs = with pkgs; [ unzip ];
    unpackPhase = ''
      unzip $src
    '';
    installPhase = ''
      mkdir -p $out/bin
      cp npiperelay.exe $out/bin/
      chmod +x $out/bin/npiperelay.exe
    '';
  };
in
{
  home.packages = with pkgs; [ socat ];
  home.sessionVariables.SSH_AUTH_SOCK = sshAuthSock;

  systemd.user.services.wsl-ssh-relay = {
    Unit = {
      Description = "Relay SSH Agent to Windows";
    };
    Service = {
      Type = "simple";
      ExecStartPre = [
        "${pkgs.coreutils}/bin/rm -f ${sshAuthSock}"
        "${pkgs.coreutils}/bin/mkdir -p ${config.home.homeDirectory}/.ssh"
      ];
      ExecStart = "${pkgs.socat}/bin/socat UNIX-LISTEN:${sshAuthSock},fork EXEC:\"${npiperelay}/bin/npiperelay.exe -ei -s //./pipe/openssh-ssh-agent\",nofork";
      Restart = "on-failure";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}
