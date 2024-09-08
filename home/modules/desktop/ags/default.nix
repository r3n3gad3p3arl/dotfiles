{ config, ... }:
let
  colors = config.colorScheme.palette;
in {
  xdg.configFile = {
    "ags" = {
      source = ./config;
      recursive = true;
    };

    "ags/colors.css" = {
      enable = config.programs.ags.enable;
    
      text = ''
        @define-color background #${colors.base01};
        @define-color background-light #${colors.base02};
        @define-color foreground #${colors.base05};
        @define-color foreground-light #${colors.base03};
        @define-color accent #${colors.base0D};
        @define-color error #${colors.base08};
        @define-color success #${colors.base0B};
      '';
    };
  };
}
