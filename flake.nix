{
   description = "meow's nixowos config";

   inputs = {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
      
      home-manager = {
         url = "github:nix-community/home-manager";
         inputs.nixpkgs.follows = "nixpkgs";
      };

      nur.url = "github:nix-community/nur";
      nix-colors.url = "github:misterio77/nix-colors";
   };

   outputs = { nixpkgs, ... }@inputs:
   let
      lib = nixpkgs.lib.extend (final: prev: { meow = import ./lib; });
   in {
      nixosConfigurations = {
         dell-laptop = lib.nixosSystem {
            inherit lib;
            specialArgs = { inherit inputs; };
            modules = lib.meow.mapModules { dir = ./hosts/modules; extraModules = [ ./hosts/dell-laptop ]; };
         };
      };
   };
}
