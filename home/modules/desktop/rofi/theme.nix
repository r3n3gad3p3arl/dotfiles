{ config, ... }: let
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
  };

  "window" = {
    background-color = mkLiteral "@bg1";
    border-color = mkLiteral "@fg2";
    border = mkLiteral "1px";
    padding = mkLiteral "0.6em";
    width = mkLiteral "25%";
  };

  "inputbar" = {
    background-color = mkLiteral "@bg2";
    text-color = mkLiteral "@fg1";
    children = [ "prompt" "entry" ];
    margin = mkLiteral "0 0 0.6em";
  };

  "prompt" = {
    text-color = mkLiteral "@bg1";
    background-color = mkLiteral "@acc";
    margin = mkLiteral "0 0.6em 0 0";
    padding = mkLiteral "0.6em";
  };

  "entry" = {
    text-color = mkLiteral "inherit";
    vertical-align = mkLiteral "0.5";
  };

  "message, error-message".text-color = mkLiteral "@fg1";
  "textbox".text-color = mkLiteral "inherit";

  "listview".lines = 8;

  "element" = {
    padding = mkLiteral "0.6em";
    border-color = mkLiteral "@fg1";
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
    size = mkLiteral "2em";
    margin = mkLiteral "0 0.3em 0 0";
  };
}
