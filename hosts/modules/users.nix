{ inputs, pkgs, ... }: {
   imports = [ inputs.home-manager.nixosModules.home-manager ];

   environment.shells = with pkgs; [ zsh ];
   programs.zsh.enable = true;

   users = {
      defaultUserShell = pkgs.zsh;

      users.meow = {
         isNormalUser = true;
         extraGroups = [ "wheel" "networkmanager" "libvirtd" ];
         initialPassword = "nixos";
      };
   };

   home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      users.meow = import ../../home;
   };
}
