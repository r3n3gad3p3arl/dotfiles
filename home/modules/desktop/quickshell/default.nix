{ lib, config, colors, ... }: {
  programs.quickshell.systemd.enable = true;

  systemd.user.services.quickshell.Service = {
    Slice = "app-graphical.slice";
    Environment = "QS_ICON_THEME=${config.gtk.iconTheme.name}";
  };

  xdg.configFile = {
    quickshell = {
      source = ./config;
      recursive = true;
    };

    "quickshell/colors.json".text = builtins.toJSON
      (lib.mapAttrs (name: value: "#${value}") colors);
  };
}
