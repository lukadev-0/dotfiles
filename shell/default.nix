{ ... }:

{
  perSystem =
    { pkgs, inputs', ... }:

    let
      inherit (inputs') ags;

      name = "luka-shell";
      entry = "src/main.tsx";

      extraPackages = [
        pkgs.libadwaita
        pkgs.libsoup_3
        ags.packages.io
        ags.packages.astal4
        ags.packages.hyprland
      ];
    in
    {
      packages.${name} = pkgs.stdenv.mkDerivation {
        name = name;
        src = ./.;

        nativeBuildInputs = [
          pkgs.wrapGAppsHook4
          pkgs.gobject-introspection
          ags.packages.default
        ];

        buildInputs = extraPackages ++ [
          pkgs.gjs
        ];

        installPhase = ''
          runHook preInstall

          mkdir -p $out/bin
          ags bundle ${entry} $out/bin/${name}

          runHook postInstall
        '';

        preFixup = ''
          gappsWrapperArgs+=(
            --prefix PATH : "${ags.packages.io}/bin"
          )
        '';
      };

      devShells.luka-shell = pkgs.mkShell {
        buildInputs = [
          pkgs.just
          (ags.packages.default.override {
            inherit extraPackages;
          })
        ] ++ extraPackages;
      };
    };
}
