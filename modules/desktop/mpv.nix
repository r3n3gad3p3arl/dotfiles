{
  flake.modules.homeManager.mpv =
    { pkgs, ... }:
    {
      programs.mpv = {
        enable = true;

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
    };
}
