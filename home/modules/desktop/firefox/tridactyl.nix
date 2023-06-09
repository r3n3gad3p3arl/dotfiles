{ config, ... }: {
   xdg.configFile."tridactyl/tridactylrc" = {
      enable = config.programs.firefox.enable;

      text = ''
         set update.lastchecktime 1685195815575
         set configversion 2.0
         set theme dark
         set newtab about:blank
         unbind <C-f>
      '';
   };
}
