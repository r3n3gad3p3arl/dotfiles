{ pkgs, ... }: {
   imports = [
      ./modules/desktop
      ./modules/neovim
      ./modules/zsh.nix
      ./modules/starship.nix
      ./modules/btop.nix
      ./modules/git.nix
      ./modules/exa.nix
   ];

   home = {
      username = "meow";
      homeDirectory = "/home/meow";
      stateVersion = "23.05";
   };

   programs.home-manager.enable = true;
   systemd.user.startServices = "sd-switch";
}
