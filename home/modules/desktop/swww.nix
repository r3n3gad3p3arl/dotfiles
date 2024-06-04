{ lib, config, pkgs, ... }:
let cfg = config.programs.swww;
in {
  options.programs.swww.enable = lib.mkEnableOption "SWWW";

  config = lib.mkIf cfg.enable {
    home = {
      packages = with pkgs; [ swww ];

      sessionVariables = {
        SWWW_TRANSITION = "wipe";
        SWWW_TRANSITION_DURATION = 0.8;
      };
    };
  };
}
