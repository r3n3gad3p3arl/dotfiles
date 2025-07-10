{ lib, inputs, outputs, pkgs, config, ... }: {
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  nixpkgs = {
    config.allowUnfree = true;

    overlays = [
      inputs.nur.overlays.default
      outputs.overlays.meowPkgs
    ];
  };

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };

    package = pkgs.lixPackageSets.latest.lix;
  };

  time.timeZone = "America/Chicago";
  i18n.defaultLocale = "en_US.UTF-8";

  console = {
    packages = with pkgs; [ terminus_font ];
    font = "${pkgs.terminus_font}/share/consolefonts/ter-v16n.psf.gz";
    earlySetup = true;
    keyMap = "us";
  };

  programs.zsh.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;

    users.meow = {
      isNormalUser = true;
      initialPassword = "nixos";
      extraGroups = [ "wheel" ]
        ++ lib.optionals config.virtualisation.libvirtd.enable [ "libvirtd" ]
        ++ lib.optionals config.virtualisation.podman.enable [ "podman" ]
        ++ lib.optionals config.networking.networkmanager.enable [ "networkmanager" ]
        ++ lib.optionals config.security.tpm2.enable [ "tss" ];
    };
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; colors = import ../../home/colors.nix; };
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
