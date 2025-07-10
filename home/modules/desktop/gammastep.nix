{ lib, config, ... }: {
  services.gammastep = {
    dawnTime = "6:00-7:45";
    duskTime = "18:35-20:15";
    settings.general.adjustment-method = "wayland";
  };

  systemd.user.services.gammastep.Service.Slice = lib.mkIf config.services.gammastep.enable "background-graphical.slice";
}
