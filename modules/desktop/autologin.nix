{
  flake.modules.nixos.autologin =
    { lib, pkgs, ... }:
    {
      services.greetd = {
        enable = true;

        settings = rec {
          initial_session = {
            command = "${lib.getExe pkgs.uwsm} start -eD Hyprland hyprland-uwsm.desktop";
            user = "meow";
          };

          default_session = initial_session;
        };
      };
    };
}
