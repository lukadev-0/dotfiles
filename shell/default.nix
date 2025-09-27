{ ... }:

{
  perSystem =
    {
      pkgs,
      lib,
      inputs',
      ...
    }:
    let
      name = "luka-shell";
    in
    {
      packages.${name} =
        pkgs.runCommand name
          {
            nativeBuildInputs = [ pkgs.makeBinaryWrapper ];
          }
          ''
            mkdir -p $out/bin
            makeWrapper ${lib.getExe pkgs.quickshell} $out/bin/${name} \
              --set QS_CONFIG_PATH ${./.}
          '';

      devShells.${name} = pkgs.mkShell {
        packages = with pkgs; [
          quickshell
          kdePackages.qtdeclarative
        ];
      };
    };
}
