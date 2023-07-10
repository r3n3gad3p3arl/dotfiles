{ pkgs, ... }: with pkgs;

mkShell {
   nativeBuildInputs = [ git ];
}
