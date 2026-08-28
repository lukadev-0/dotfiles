{
  lib,
  stdenvNoCC,
  ncurses,
}:
let
  inherit (lib) fileset;
in
stdenvNoCC.mkDerivation {
  name = "windows-terminal-terminfo";

  src = fileset.toSource {
    root = ./.;
    fileset = ./windows-terminal.terminfo;
  };

  nativeBuildInputs = [ ncurses ];

  buildPhase = ''
    mkdir -p "$out/share/terminfo"
    tic -xo "$out/share/terminfo" windows-terminal.terminfo
  '';
}
