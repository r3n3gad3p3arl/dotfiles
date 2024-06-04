{ lib, pkgs, config, inputs, ... }:
let cfg = config.system.desktop;
in {
  imports = [
    inputs.aagl.nixosModules.default
  ] ++ lib.meow.mapModules ./.;

  options.system.desktop.enable = lib.mkEnableOption "desktop configuration";

  config = lib.mkIf cfg.enable {
    nix.settings = inputs.aagl.nixConfig;
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
            command = "${pkgs.dbus}/bin/dbus-run-session ${pkgs.hyprland}/bin/Hyprland";
            user = "meow";
          };

          default_session = initial_session;
        };
      };

      gvfs.enable = true;
    };

    programs = {
      hyprland.enable = true;
      steam.enable = true;
      gamemode.enable = true;
      anime-game-launcher.enable = true;
    };

    hardware.opengl = {
      enable = true;
      driSupport32Bit = true;

      extraPackages = with pkgs; [
        intel-media-driver
        intel-vaapi-driver
        vaapiVdpau
        libvdpau-va-gl
      ];
    };

    fonts = {
      packages = with pkgs; [
        noto-fonts
        noto-fonts-cjk
        noto-fonts-emoji
        jetbrains-mono
        source-code-pro
        lexend
        rubik
        (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
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
