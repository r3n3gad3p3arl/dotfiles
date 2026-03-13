{ config, ... }:
{
  services.avahi = {
    enable = config.services.printing.enable;
    nssmdns4 = true;
  };
}
