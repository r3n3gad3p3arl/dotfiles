{
  flake.modules.nixos.fonts =
    { pkgs, ... }:
    {
      fonts = {
        packages = with pkgs; [
          noto-fonts
          noto-fonts-cjk-sans
          noto-fonts-color-emoji
        ];

        fontconfig.defaultFonts = {
          serif = [ "Noto Serif" ];
          sansSerif = [ "Noto Sans" ];
          monospace = [ "Noto Sans Mono" ];
          emoji = [ "Noto Color Emoji" ];
        };
      };
    };

  flake.modules.homeManager.fonts =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        roboto-mono
        inter
        nerd-fonts.symbols-only
      ];

      fonts.fontconfig.defaultFonts = {
        sansSerif = [ "Inter" ];
        monospace = [ "Roboto Mono" ];
      };
    };
}
