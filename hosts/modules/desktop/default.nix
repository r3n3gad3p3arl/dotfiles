{ lib, pkgs, config, inputs, ... }:
let cfg = config.system.desktop;
in {
  imports = lib.meow.mapModules ./.;

  options.system.desktop.enable = lib.mkEnableOption "desktop configuration";

  config = lib.mkIf cfg.enable {
    security.rtkit.enable = true;

    services = {
      pipewire = {
        enable = true;

        alsa = {
          enable = true;
          support32Bit = true;
        };

        pulse.enable = true;
        jack.enable = true;
      };

      greetd = {
        enable = true;

        settings = rec {
          initial_session = {
            command = "${lib.getExe pkgs.uwsm} start -- ${lib.getExe pkgs.hyprland}";
            user = "meow";
          };

          default_session = initial_session;
        };
      };
    };

    programs = {
      hyprland.enable = true;
      steam.enable = true;
      gamemode.enable = true;
    };

    hardware.graphics = {
      enable = true;
      enable32Bit = true;

      extraPackages = with pkgs; [
        intel-media-driver
        intel-compute-runtime
        vpl-gpu-rt
        intel-ocl
      ];
    };

    fonts = {
      packages = with pkgs; [
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-color-emoji
      ];

      fontconfig.defaultFonts = {
        serif = [ "Noto Serif" ];
        sansSerif = [ "Noto Sans" ];
        monospace = [ "Noto Sans Mono" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
