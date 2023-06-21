{ lib, config, ... }: with lib;
let cfg = config.system.laptop;
in {
   options.system.laptop.enable = mkEnableOption (mdDoc "laptop configuration");

   config = mkIf cfg.enable {
      # most laptops are going to be used as desktop systems
      system.desktop.enable = mkDefault true;

      # network manager is most useful for portable devices
      networking.networkmanager.enable = mkDefault true;

      # slows down boot time + unecessary for local booting
      systemd.services."NetworkManager-wait-online".enable = mkDefault false;

      # grub supports full-disk encryption, good security practice for portable devices
      boot = {
         loader = {
            grub = {
               enable = true;

               # any laptop i use will probably be efi-capable
               device = "nodev";
               efiSupport = true;

               # whole point of using grub in this instance
               enableCryptodisk = true;

               # vanilla grub look
               splashImage = null;
            };

            systemd-boot.enable = false;

            # efi partition is separate from boot because it can't be encrypted
            efi.efiSysMountPoint = "/efi";
         };

         # prevents asking for encryption password twice during boot
         initrd = {
            luks.devices."crypt_root".keyFile = "/crypto_keyfile.bin";
            secrets = { "/crypto_keyfile.bin" = null; };
         };
      };

      # i prefer hibernation on lid close
      services.logind.lidSwitch = mkDefault "hibernate";
   };
}
