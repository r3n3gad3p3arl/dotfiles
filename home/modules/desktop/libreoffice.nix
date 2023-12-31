{ lib, config, pkgs, ... }: with lib;
let cfg = config.programs.libreoffice;
in {
  options.programs.libreoffice.enable = mkEnableOption "LibreOffice";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      libreoffice
      hunspell
      hunspellDicts.en-us
    ];
  };
}
