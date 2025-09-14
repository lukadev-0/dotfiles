{ ... }:

{
  perSystem =
    { pkgs, inputs', ... }:
    {
      devShells.luka-shell = pkgs.mkShell {
        buildInputs = with pkgs; [
          quickshell
          kdePackages.qtdeclarative
        ];
      };
    };
}
