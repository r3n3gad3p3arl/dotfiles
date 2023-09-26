{ pkgs, ... }: {
   programs.mpv.scripts = with pkgs.mpvScripts; [ mpris pkgs.meowPkgs.mpvScripts.notify-send ];
}
