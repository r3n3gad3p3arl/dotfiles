{ pkgs, lib, config, osConfig, ... }:
let cfg = config.programs.blender;
in {
  options.programs.blender.enable = lib.mkEnableOption "Blender";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [ blender ];

    xdg.desktopEntries.blender = lib.mkIf osConfig.hardware.nvidia.prime.offload.enable {
      name = "Blender";
      genericName = "3D modeler";
      comment = "3D modeling, animation, rendering and post-production";
      exec = "nvidia-offload blender %f";
      icon = "blender";
      terminal = false;
      type = "Application";
      categories = [ "Graphics" "3DGraphics" ];
      mimeType = [ "application/x-blender" ];

      settings = {
        Keywords = "3d;cg;modeling;animation;painting;sculpting;texturing;video editing;video tracking;rendering;render engine;cycles;python;";
        StartupWMClass = "Blender";
      };
    };
  };
}
