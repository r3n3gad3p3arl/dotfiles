{ pkgs, config, ... }: {
   programs.rofi = {
      package = pkgs.rofi-wayland;
      cycle = true;
      font = "Dina 11";
      terminal = "footclient";
      theme = import ./theme.nix { inherit config; };
   };
}
