{ pkgs, ... }: {
   home.packages = with pkgs; [ libsixel ];

   programs.foot = {
      enable = true;

      settings = {
         main = {
            font = "Dina,Cozette,Unifont";
            pad = "8x8";
         };

         colors = {
            background = "1d1f21";
            foreground = "c5c8c6";

            regular0 = "1d1f21";
            regular1 = "cc6666";
            regular2 = "b5bd68";
            regular3 = "f0c674";
            regular4 = "81a2be";
            regular5 = "b294bb";
            regular6 = "8abeb7";
            regular7 = "c5c8c6";

            bright0 = "969896";
            bright1 = "de935f";
            bright2 = "282a2e";
            bright3 = "373b41";
            bright4 = "b4b7b4";
            bright5 = "e0e0e0";
            bright6 = "a3685a";
            bright7 = "ffffff";
         };
      };
   };
}
