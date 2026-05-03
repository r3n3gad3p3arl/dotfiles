{
  lib,
  config,
  ...
}:
let
  inherit (config.programs) hyprland;
in
{
  security.pam.services.hyprlock = lib.mkIf hyprland.enable { };
  programs.hyprland.withUWSM = true;
}
