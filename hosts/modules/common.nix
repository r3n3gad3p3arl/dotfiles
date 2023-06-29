{ lib, inputs, outputs, pkgs, config, ... }: {
   imports = [ inputs.home-manager.nixosModules.home-manager ];

   nixpkgs = {
      # unfortunately, proprietary software is sometimes necessary :(
      config.allowUnfree = true;

      overlays = [
         # nix user repository packages
         inputs.nur.overlay

         # custom packages
         outputs.overlays.meowPkgs
      ];
   };

   nix.settings = {
      # allow flakes because my configuration depends on them
      experimental-features = "nix-command flakes";

      # deduplicate nix store automatically to save disk space
      auto-optimise-store = true;
   };

   # computer speak american pls
   time.timeZone = "America/Chicago";
   i18n.defaultLocale = "en_US.UTF-8";

   console = {
      # the default tty font is disgustingly illegible
      packages = with pkgs; [ terminus_font ];
      font = "${pkgs.terminus_font}/share/consolefonts/ter-v16n.psf.gz";
      earlySetup = true;

      # qwerty kings rise up
      keyMap = "us";
   };

   # i like syntax highlighting
   environment.shells = with pkgs; [ zsh ];
   programs.zsh.enable = true;

   users = {
      defaultUserShell = pkgs.zsh;
      
      # i'm the only person who uses my computers
      users.meow = {
         isNormalUser = true;

         # used to login once after install then promptly changed
         initialPassword = "nixos";

         # give myself sudo permissions + more
         extraGroups = [ "wheel" "networkmanager" "libvirtd" ];
      };
   };

   # managing my dotfiles the nix way
   home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = { inherit inputs; };
      users.meow = import ../../home;
   };

   # curse you, proprietary drivers! >:(
   hardware.enableRedistributableFirmware = true;

   # keep my ssds fast and healthy with periodic garbage collection
   services.fstrim.enable = true;

   # simple bootloader
   boot.loader = {
      systemd-boot = {
         enable = lib.mkDefault true;
         editor = false;
      };

      efi.canTouchEfiVariables = true;
   };
}
