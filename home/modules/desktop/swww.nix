{ lib, config, pkgs, ... }: with lib;
let cfg = config.programs.swww;
in {
  options.programs.swww.enable = mkEnableOption "SWWW";

  config = mkIf cfg.enable {
    home = {
      packages = with pkgs; [ swww ];

      sessionVariables = {
        SWWW_TRANSITION = "wipe";
        SWWW_TRANSITION_DURATION = 0.8;
      };
    };
  };
}
