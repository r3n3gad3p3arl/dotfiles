{ lib, config, ... }:
let
  printing = config.services.printing;
in {
  services.avahi = lib.mkIf printing.enable {
    enable = true;
    nssmdns4 = true;
  };
}
