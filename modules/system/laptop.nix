{
  flake.modules.nixos.laptop = {
    networking.networkmanager.wifi.powersave = true;
    systemd.sleep.settings.Sleep.HibernateDelaySec = "1h";

    services = {
      logind.settings.Login.HandleLidSwitch = "sleep";
      upower.enable = true;
      power-profiles-daemon.enable = true;
      thermald.enable = true;
    };

    hardware.nvidia.prime.offload = {
      enable = true;
      enableOffloadCmd = true;
    };
  };

  flake.modules.homeManager.laptop = {
    services.batsignal.enable = true;
  };
}
