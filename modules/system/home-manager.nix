{ inputs, ... }:
{
  flake.modules.nixos.homeManager = {
    imports = [ inputs.home-manager.nixosModules.home-manager ];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "backup";
    };
  };

  flake.modules.homeManager.homeManager = {
    programs.home-manager.enable = true;
    home.stateVersion = "23.05";
  };
}
