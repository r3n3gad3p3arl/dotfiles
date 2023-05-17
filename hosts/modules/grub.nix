{ config, ... }: {
   boot = {
      loader = {
         grub = {
            enable = true;
            device = "nodev";
            efiSupport = true;
            enableCryptodisk = true;
         };

         efi = {
            canTouchEfiVariables = true;
            efiSysMountPoint = "/efi";
         };
      };

      initrd = {
         luks.devices."crypt_root".keyFile = "/crypto_keyfile.bin";
         secrets = { "/crypto_keyfile.bin" = null; };
      };

      kernelParams = [ "resume_offset=8298496" ];
      resumeDevice = config.fileSystems."/".device;
   };

   swapDevices = [{ device = "/swapfile"; size = 16*1024; }];
}
