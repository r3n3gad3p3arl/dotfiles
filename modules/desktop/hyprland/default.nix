{ self, ... }:
{
  flake.modules.nixos.hyprland = {
    programs.hyprland = {
      enable = true;
      withUWSM = true;
    };
  };

  flake.modules.homeManager.hyprland =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      wayland.windowManager.hyprland = {
        enable = true;
        systemd.enable = false;
        configType = "lua";

        extraLuaFiles = {
          "hyprland.variables" = {
            content = ''
              cursor = {
                name = "${config.home.pointerCursor.name}",
                size = ${toString config.home.pointerCursor.size},
              }

              colors = ${lib.generators.toLua { } config.colors}

              screenshotDir = "${config.xdg.userDirs.pictures}"

              scripts = ${lib.generators.toLua { } (lib.mapAttrs (name: value: (lib.getExe value)) self.legacyPackages.${pkgs.stdenv.hostPlatform.system}.scripts)}

              programs = {
                terminal = "uwsm app -T",
                browser = "uwsm app -- firefox.desktop",
                calculator = "uwsm app -T -- ${lib.getExe pkgs.libqalculate}",
                lockscreen = "uwsm app -- hyprlock",
                playerctl = "${lib.getExe pkgs.playerctl}",
                brightnessctl = "${lib.getExe pkgs.brightnessctl}",
              }
            '';

            autoLoad = false;
          };

          "hyprland.general" = ./config/general.lua;
          "hyprland.autostart" = ./config/autostart.lua;
          "hyprland.binds" = ./config/binds.lua;
          "hyprland.rules" = ./config/rules.lua;
        };
      };
    };
}
