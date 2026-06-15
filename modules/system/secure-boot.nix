{ inputs, ... }:
{
  flake.modules.nixos.secureBoot =
    { lib, ... }:
    {
      imports = [ inputs.lanzaboote.nixosModules.lanzaboote ];

      boot = {
        loader.systemd-boot.enable = lib.mkForce false;

        lanzaboote = {
          enable = true;
          pkiBundle = "/var/lib/sbctl";
        };
      };
    };
}
