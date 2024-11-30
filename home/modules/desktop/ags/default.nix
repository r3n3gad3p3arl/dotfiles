{ config, pkgs, inputs, ... }:
let
  colors = config.scheme.withHashtag;
in {
  xdg.configFile = {
    "ags" = {
      source = ./config;
      recursive = true;
    };

    "ags/colors.css" = {
      enable = config.programs.ags.enable;
    
      text = ''
        @define-color background ${colors.base01};
        @define-color background-light ${colors.base02};
        @define-color foreground ${colors.base05};
        @define-color foreground-light ${colors.base03};
        @define-color accent ${colors.base0D};
        @define-color error ${colors.base08};
        @define-color success ${colors.base0B};
      '';
    };
  };

  programs.ags.extraPackages = [
    inputs.ags.packages.${pkgs.system}.battery
    inputs.ags.packages.${pkgs.system}.apps
    inputs.ags.packages.${pkgs.system}.notifd
  ];
}
