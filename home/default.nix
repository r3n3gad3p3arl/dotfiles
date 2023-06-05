{ lib, ... }: {
   imports = lib.meow.mapModules { dir = ./modules; };

   home = {
      username = "meow";
      homeDirectory = "/home/meow";
      stateVersion = "23.05";
   };

   programs.home-manager.enable = true;
   systemd.user.startServices = "sd-switch";
}
