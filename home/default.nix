{ pkgs, ... }: {
   imports = [
      ./modules/desktop
      ./modules/neovim.nix
      ./modules/zsh.nix
      ./modules/starship.nix
      ./modules/btop.nix
   ];

   home = {
      username = "meow";
      homeDirectory = "/home/meow";
      stateVersion = "23.05";
   };

   programs = {
      home-manager.enable = true;

      git = {
         enable = true;
         userName = "r3n3gad3p3arl";
         userEmail = "r3n3gad3p3arl@noreply.codeberg.org";
         extraConfig = { init.defaultBranch = "main"; };
      };

      exa = {
         enable = true;
         enableAliases = true;
         extraOptions = [ "--group-directories-first" ];
      };
   };

   systemd.user.startServices = "sd-switch";
}
