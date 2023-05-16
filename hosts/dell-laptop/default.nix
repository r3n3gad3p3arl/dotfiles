{ inputs, config, pkgs, ... }: {
   imports = [
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager
   ];

   nixpkgs = {
      config.allowUnfree = true;
      overlays = [ inputs.nur.overlay ];
   };

   nix.settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
   };
   
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

   networking = {
      hostName = "dell-laptop";
      networkmanager.enable = true;
   };

   systemd.services."NetworkManager-wait-online".enable = false;

   time.timeZone = "America/Chicago";
   i18n.defaultLocale = "en_US.UTF-8";

   console = {
      packages = with pkgs; [ terminus_font ];
      font = "${pkgs.terminus_font}/share/consolefonts/ter-v16n.psf.gz";
      earlySetup = true;
      keyMap = "us";
   };

   users = {
      defaultUserShell = pkgs.zsh;

      users.meow = {
         isNormalUser = true;
         extraGroups = [ "wheel" "networkmanager" "libvirtd" "adbusers" ];
         initialPassword = "nixos";
      };
   };

   home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      users.meow = import ../../home;
   };

   environment = {
      systemPackages = with pkgs; [ wget jdk17 ];
      shells = with pkgs; [ zsh ];
   };

   hardware = {
      nvidia = {
         modesetting.enable = true;
         
         prime = {
            offload = {
               enable = true;
               enableOffloadCmd = true;
            };

            nvidiaBusId = "PCI:60:0:0";
            intelBusId = "PCI:0:2:0";
         };

         powerManagement = {
            enable = true;
            finegrained = true;
         };
      };

      enableRedistributableFirmware = true;
   };

   virtualisation.libvirtd.enable = true;

   security = {
      rtkit.enable = true;
      pam.services.swaylock = {};
   };

   services = {
      xserver.videoDrivers = [ "nvidia" ];
      fstrim.enable = true;

      pipewire = {
         enable = true;
         
         alsa = {
            enable = true;
            support32Bit = true;
         };

         pulse.enable = true;
         jack.enable = true;
      };

      logind = {
         lidSwitch = "hibernate";
         extraConfig = "IdleAction=suspend";
      };
   };

   programs = {
      hyprland = {
         enable = true;
         nvidiaPatches = true;
      };

      zsh.enable = true;
      steam.enable = true;
      gamemode.enable = true;
      adb.enable = true;
   };

   fonts = {
      fonts = with pkgs; [
         noto-fonts
         noto-fonts-cjk
         noto-fonts-emoji
      ];

      fontconfig.defaultFonts = {
         serif = [ "Noto Serif" ];
         sansSerif = [ "Noto Sans" ];
         monospace = [ "Noto Sans Mono" ];
         emoji = [ "Noto Color Emoji" ];
      };
   };

   system.stateVersion = "23.05";
}
