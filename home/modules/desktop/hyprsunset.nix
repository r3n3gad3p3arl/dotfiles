{ lib, config, ... }:
{
  services.hyprsunset.settings.profile = [
    {
      time = "7:00";
      identity = true;
    }
    {
      time = "21:00";
      temperature = 4500;
      gamma = 0.8;
    }
  ];

  systemd.user.services.hyprsunset.Service.Slice =
    lib.mkIf config.services.hyprsunset.enable "background-graphical.slice";
}
