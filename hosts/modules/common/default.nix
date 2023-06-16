{ inputs, pkgs, ... }: {
   imports = [ ./users.nix ];

   nixpkgs = {
      config.allowUnfree = true;
      overlays = [
         inputs.nur.overlay
         inputs.nixd.overlays.default
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

   environment.systemPackages = with pkgs; [ wget unzrip ffmpeg ];
   hardware.enableRedistributableFirmware = true;

   services = {
      fstrim.enable = true;
      logind.lidSwitch = "hibernate";
   };
}
