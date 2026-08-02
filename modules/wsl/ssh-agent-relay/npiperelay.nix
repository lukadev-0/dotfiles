{ stdenvNoCC, fetchzip }:
stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "npiperelay";
  version = "0.1.0";

  src = fetchzip {
    url = "https://github.com/jstarks/npiperelay/releases/download/v${finalAttrs.version}/npiperelay_windows_amd64.zip";
    stripRoot = false;
    hash = "sha256-GcwreB8BXYGNKJihE2xeelsroy+JFqLK1NK7Ycqxw5g=";
  };

  installPhase = ''
    mkdir -p "$out/bin"
    chmod +x npiperelay.exe
    cp npiperelay.exe "$out/bin"
  '';

  meta.mainProgram = "npiperelay.exe";
})
