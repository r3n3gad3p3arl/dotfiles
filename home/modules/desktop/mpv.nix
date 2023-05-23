{ pkgs, ... }: {
   programs = {
      yt-dlp.enable = true;

      mpv = {
         enable = true;
         scripts = with pkgs.mpvScripts; [ mpris ];
      };
   };
}
