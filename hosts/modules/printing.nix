{ lib, config, ... }: with lib;
let printing = config.services.printing;
in {
   services.avahi = mkIf printing.enable {
      enable = true;
      nssmdns = true;
   };
}
