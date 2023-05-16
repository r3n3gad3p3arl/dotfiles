{
   description = "meow's nixowos config";

   inputs = {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
      
      home-manager = {
         url = "github:nix-community/home-manager";
         inputs.nixpkgs.follows = "nixpkgs";
      };

      nur.url = "github:nix-community/nur";
   };

   outputs = { nixpkgs, ... }@inputs: {
      nixosConfigurations = {
         dell-laptop = nixpkgs.lib.nixosSystem {
            specialArgs = { inherit inputs; };
            modules = [ ./hosts/dell-laptop ];
         };
      };
   };
}
