{ lib, config, pkgs, ... }: {
  programs.swaylock.settings =
  let colors = config.colorScheme.colors;
  in {
    color = colors.base00;

    font = "Rubik";

    indicator-radius = 40;
    indicator-thickness = 4;
    indicator-x-position = 60;
    indicator-y-position = 60;

    inside-color = colors.base00;
    inside-caps-lock-color = colors.base00;
    inside-clear-color = colors.base0A;
    inside-ver-color = colors.base0B;
    inside-wrong-color = colors.base08;

    bs-hl-color = colors.base08;
    key-hl-color = colors.base05;
    separator-color = "00000000";

    text-color = colors.base05;
    text-caps-lock-color = colors.base09;
    text-clear-color = colors.base00;
    text-ver-color = colors.base00;
    text-wrong-color = colors.base00;

    ring-color = colors.base0D;
    ring-caps-lock-color = colors.base09;
    ring-clear-color = colors.base0A;
    ring-ver-color = colors.base0B;
    ring-wrong-color = colors.base08;

    line-uses-inside = true;
  };
}
