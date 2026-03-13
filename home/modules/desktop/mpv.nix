{ pkgs, ... }:
{
  programs.mpv = {
    scripts = with pkgs.mpvScripts; [
      mpris
      mpv-notify-send
    ];

    config = {
      hwdec = "auto-safe";
      vo = "gpu";
      profile = "gpu-hq";
    };
  };
}
