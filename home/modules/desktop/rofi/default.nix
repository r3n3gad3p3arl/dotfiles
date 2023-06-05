{ pkgs, config, ... }: {
   programs.rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
      cycle = true;
      font = "Dina 11";
      terminal = "footclient";
      theme = import ./theme.nix { inherit config; };
   };
}
