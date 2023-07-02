{ lib, inputs, outputs, pkgs, ... }: {
   imports = [ inputs.home-manager.nixosModules.home-manager ];

   nixpkgs = {
      config.allowUnfree = true;

      overlays = [
         inputs.nur.overlay
         outputs.overlays.meowPkgs
      ];
   };

   nix.settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
   };

   time.timeZone = "America/Chicago";
   i18n.defaultLocale = "en_US.UTF-8";

   console = {
      packages = with pkgs; [ terminus_font ];
      font = "${pkgs.terminus_font}/share/consolefonts/ter-v16n.psf.gz";
      earlySetup = true;
      keyMap = "us";
   };

   environment.shells = with pkgs; [ zsh ];
   programs.zsh.enable = true;

   users = {
      defaultUserShell = pkgs.zsh;
      
      users.meow = {
         isNormalUser = true;
         initialPassword = "nixos";
         extraGroups = [ "wheel" "libvirtd" ];
      };
   };

   home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = { inherit inputs; };
      users.meow = import ../../home;
   };

   hardware.enableRedistributableFirmware = true;

   services = {
      fstrim.enable = true;
      fwupd.enable = true;
   };

   boot.loader = {
      systemd-boot = {
         enable = lib.mkDefault true;
         editor = false;
      };

      efi.canTouchEfiVariables = true;
   };
}
