{ lib, config, ... }:
{
  services.hyprsunset.settings.profile = [
    {
      time = "7:15";
      identity = true;
    }
    {
      time = "20:15";
      temperature = 4500;
      gamma = 0.8;
    }
  ];

  systemd.user.services.hyprsunset.Service.Slice =
    lib.mkIf config.services.hyprsunset.enable "background-graphical.slice";
}
