{ pkgs, ... }: {
  home.packages = with pkgs; [
    roboto-mono
    inter
    nerd-fonts.symbols-only
  ];

  fonts.fontconfig.defaultFonts = {
    sansSerif = [ "Inter" ];
    monospace = [ "Roboto Mono" ];
  };
}
