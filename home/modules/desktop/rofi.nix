{ pkgs, ... }: {
   programs.rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
      cycle = true;
      font = "Dina 11";
      terminal = "footclient";
      theme = ../../config/rofi/themes/tomorrow-night.rasi;
   };
}
