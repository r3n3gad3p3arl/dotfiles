{
  flake.modules.nixos.ydotool = {
    programs.ydotool.enable = true;
    users.users.meow.extraGroups = [ "ydotool" ];
  };
}
