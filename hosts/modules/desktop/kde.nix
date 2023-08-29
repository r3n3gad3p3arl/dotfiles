{ config, pkgs, ... }: 
let kde = config.services.xserver.desktopManager.plasma5;
in {
   services.xserver = {
      enable = kde.enable;

      displayManager = {
         sddm.enable = kde.enable;
         defaultSession = "plasmawayland";
      };
   };

   environment.plasma5.excludePackages = with pkgs.libsForQt5; [ konsole ];
}
