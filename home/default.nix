{ lib, osConfig, ... }: {
  imports = lib.meow.mapModules ./modules;

  home = rec {
    username = "meow";
    homeDirectory = "/home/${username}";
    stateVersion = "23.05";
    desktop.enable = osConfig.system.desktop.enable;
  };

  programs = {
    home-manager.enable = true;
    nixvim.enable = true;
    btop.enable = true;
    eza.enable = true;
    git.enable = true;
    starship.enable = true;
    zsh.enable = osConfig.programs.zsh.enable;
  };

  systemd.user.startServices = "sd-switch";
}
