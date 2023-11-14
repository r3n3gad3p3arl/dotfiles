{ config, ... }:
let
   mkLiteral = config.lib.formats.rasi.mkLiteral;
   colors = config.colorScheme.colors;
in {
   "*" = {
      bg1 = mkLiteral "#${colors.base00}";
      bg2 = mkLiteral "#${colors.base01}";
      fg1 = mkLiteral "#${colors.base05}";
      fg2 = mkLiteral "#${colors.base03}";
      acc = mkLiteral "#${colors.base0D}";

      background-color = mkLiteral "transparent";
      border-radius = 0;
   };

   "window" = {
      background-color = mkLiteral "@bg1";
      border-color = mkLiteral "@fg2";
      border = 1;
      width = 400;
      padding = 8;
   };

   "inputbar" = {
      text-color = mkLiteral "@fg1";
      children = [ "prompt" "entry" ];
      margin = mkLiteral "0 0 8";
   };

   "prompt" = {
      text-color = mkLiteral "@bg1";
      background-color = mkLiteral "@acc";
      margin = mkLiteral "0 4 0 0";
      padding = mkLiteral "4 8";
   };

   "entry" = {
      text-color = mkLiteral "inherit";
      vertical-align = mkLiteral "0.5";
   };

   "listview".lines = 8;

   "element" = {
      padding = mkLiteral "8";
   };

   "element normal.normal, element alternate.normal".text-color = mkLiteral "@fg2";

   "element selected.normal" = {
      text-color = mkLiteral "@fg1";
      background-color = mkLiteral "@bg2";
   };

   "element-text" = {
      text-color = mkLiteral "inherit";
      highlight = mkLiteral "none #${colors.base0D}";
      vertical-align = mkLiteral "0.5";
   };

   "element-icon" = {
      size = 24;
      margin = mkLiteral "0 4 0 0";
   };
}
