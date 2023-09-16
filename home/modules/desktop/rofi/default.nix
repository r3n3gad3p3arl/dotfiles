{ pkgs, config, ... }: {
   programs.rofi = {
      package = pkgs.rofi-wayland;
      cycle = true;
      font = "Lexend 9";
      terminal = "footclient";
      theme = import ./theme.nix { inherit config; };

      extraConfig = {
         modi = "drun,run";
         show-icons = true;
      };
   };
}
