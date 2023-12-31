{ lib, inputs, config, ... }: {
  imports = [ inputs.lanzaboote.nixosModules.lanzaboote ];

  boot = lib.mkIf config.boot.lanzaboote.enable {
    loader.systemd-boot.enable = lib.mkForce false;
    lanzaboote.pkiBundle = "/etc/secureboot";
  };
}
