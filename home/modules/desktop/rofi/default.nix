{ pkgs, config, ... }: {
  programs.rofi = {
    package = pkgs.rofi-wayland;
    cycle = true;
    font = "Rubik 9";
    terminal = "foot";
    theme = import ./theme.nix { inherit config; };

    extraConfig = {
      modi = "drun,run";
      show-icons = true;
    };
  };
}
