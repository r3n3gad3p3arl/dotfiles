{ pkgs, ... }: {
   programs.swaylock = {
      enable = true;
      package = pkgs.swaylock-effects;

      settings = {
         image = "${../../wallpapers/rei.jpg}";

         font = "Fantasque Sans Mono";

         clock = true;

         indicator-radius = 100;
         indicator-thickness = 5;
         indicator-x-position = 140;
         indicator-y-position = 140;
         indicator-idle-visible = true;

         inside-color = "1d1f21";
         inside-caps-lock-color = "1d1f21";
         inside-clear-color = "f0c674";
         inside-ver-color = "b5bd68";
         inside-wrong-color = "cc6666";

         bs-hl-color = "cc6666";
         key-hl-color = "c5c8c6";
         separator-color = "00000000";

         text-color = "c5c8c6";
         text-caps-lock-color = "de935f";
         text-clear-color = "1d1f21";
         text-ver-color = "1d1f21";
         text-wrong-color = "1d1f21";

         ring-color = "81a2be";
         ring-caps-lock-color = "de935f";
         ring-clear-color = "f0c674";
         ring-ver-color = "b5bd68";
         ring-wrong-color = "cc6666";

         line-uses-inside = true;
      };
   };
}
