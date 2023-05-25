{ pkgs, ... }: {
   home.packages = with pkgs; [ osu-lazer-bin ];

   xdg.desktopEntries."osu!" = {
      name = "osu!";
      exec = "nvidia-offload gamemoderun ${pkgs.osu-lazer-bin}/bin/osu!";
      categories = [ "Game" ];
   };
}
