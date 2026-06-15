{
  flake.modules.homeManager.hyprsunset = {
    services.hyprsunset = {
      enable = true;

      settings.profile = [
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
    };

    systemd.user.services.hyprsunset.Service.Slice = "background-graphical.slice";
  };
}
