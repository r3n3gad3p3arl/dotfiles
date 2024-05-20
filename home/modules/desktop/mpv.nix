{ pkgs, ... }: {
  programs.mpv = {
    scripts = with pkgs.mpvScripts; [ mpris ];

    config = {
      hwdec = "auto-safe";
      vo = "gpu";
      profile = "gpu-hq";
    };
  };
}
