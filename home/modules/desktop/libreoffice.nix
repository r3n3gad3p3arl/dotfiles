{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.programs.libreoffice;
in
{
  options.programs.libreoffice.enable = lib.mkEnableOption "LibreOffice";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      libreoffice-qt
      hunspell
      hunspellDicts.en-us
    ];
  };
}
