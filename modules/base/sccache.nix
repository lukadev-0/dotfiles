{ pkgs, lib, ... }:
let
  inherit (pkgs) sccache;
in
{
  home = {
    home.packages = [ sccache ];
    home.sessionVariables = {
      RUSTC_WRAPPER = lib.getExe sccache;
      SCCACHE_SERVER_UDS = "$XDG_RUNTIME_DIR/sccache.sock";
    };
  };
}
