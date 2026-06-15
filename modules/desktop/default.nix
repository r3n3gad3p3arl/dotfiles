{ inputs, ... }:
{
  flake.modules.nixos.desktop = {
    imports = with inputs.self.modules.nixos; [
      autologin
      bluetooth
      fonts
      graphics
      hyprland
      hyprlock
      pcmanfm
      pipewire
      ydotool
    ];
  };

  flake.modules.homeManager.desktop = {
    imports = with inputs.self.modules.homeManager; [
      bluetooth
      chromium
      clipboard
      colors
      cursor
      dunst
      firefox
      fonts
      foot
      gtk
      hyprland
      hyprlock
      hyprpaper
      hyprsunset
      keepassxc
      mpv
      pcmanfm
      qt
      quickshell
      wine
      xdg
      yt-dlp
    ];
  };
}
