{ mkLiteral, ... }: {
   "*" = {
      bg = mkLiteral "#1d1f21";
      fg = mkLiteral "#c5c8c6";
      light-grey = mkLiteral "#969896";
      blue = mkLiteral "#81a2be";

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
   "element normal.normal, element alternate.normal".text-color = mkLiteral "@light-grey";
   "element selected.normal".text-color = mkLiteral "@fg";

   "element-text" = {
      text-color = mkLiteral "inherit";
      highlight = mkLiteral "none #81a2be";
   };
}
