{ config, ... }:
let
   mkLiteral = config.lib.formats.rasi.mkLiteral;
   colors = config.colorScheme.colors;
in {
   "*" = {
      bg = mkLiteral "#${colors.base00}";
      fg = mkLiteral "#${colors.base05}";
      light-grey = mkLiteral "#${colors.base03}";
      blue = mkLiteral "#${colors.base0D}";

      background-color = mkLiteral "transparent";
   };

   "window" = {
      background-color = mkLiteral "@bg";
      border-color = mkLiteral "@light-grey";
      border = 1;
      padding = 8;
      width = 400;
   };

   "inputbar" = {
      text-color = mkLiteral "@fg";
      children = [ "prompt" "entry" ];
      margin = mkLiteral "0 0 4";
   };

   "prompt" = {
      text-color = mkLiteral "@blue";
      text-transform = mkLiteral "bold";
      margin = mkLiteral "0 4 0 0";
   };

   "entry".text-color = mkLiteral "inherit";
   "element".margin = mkLiteral "2 0";
   "element normal.normal, element alternate.normal".text-color = mkLiteral "@light-grey";
   "element selected.normal".text-color = mkLiteral "@fg";

   "element-text" = {
      text-color = mkLiteral "inherit";
      highlight = mkLiteral "none #${colors.base0D}";
   };
}
